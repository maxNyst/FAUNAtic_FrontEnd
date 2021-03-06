import 'package:faunatic_front_end/Screens/Favorites/favorites.dart';
import 'package:faunatic_front_end/Screens/SpeciesSearch/species_intersection_screen.dart';
import 'package:faunatic_front_end/species_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faunatic_front_end/Screens/Excursions%20Search/excursions_search_screen.dart';
import 'package:faunatic_front_end/Screens/Excursions/excursions_screen.dart';
import 'package:faunatic_front_end/Screens/Home/home_screen.dart';
import 'package:faunatic_front_end/Screens/Lecture/lecture_screen.dart';
import 'package:faunatic_front_end/Screens/Moment/moments_screen.dart';
import 'package:faunatic_front_end/Screens/Saved%20Excursions/saved_excursions_screen.dart';
import 'package:faunatic_front_end/Screens/Sign%20Up/signup_screen.dart';
import 'package:faunatic_front_end/Screens/Species%20Detail/species_detail.dart';
import 'package:faunatic_front_end/Screens/SpeciesSearch/search_screen.dart';
import 'package:faunatic_front_end/main.dart';

import 'package:faunatic_front_end/Screens/Assignments/new_assignment.dart';
import 'package:provider/provider.dart';
import 'excursion_model.dart';
import 'firestore_service.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    // To send arguments from one page
    // to another, use this syntax:
    //
    // case '/search/details':
    //   return MaterialPageRoute(
    //     builder: (context) => SpeciesDetailsScreen(
    //       specie: args as Specie,
    //     ),
    //   );
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => AuthenticationWrapper());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case '/species/intersection':
        return MaterialPageRoute(builder: (context) => IntersectionScreen());
      case '/search':
        return MaterialPageRoute(builder: (context) => SpeciesSearchScreen());
      case '/lectures':
        return MaterialPageRoute(
            builder: (context) =>
                LecturesScreen()); // The example in our code right now
      case '/excursions/assignment':
        return MaterialPageRoute(builder: (context) => NewAssignmentScreen());
      case '/excursions/moment':
        return MaterialPageRoute(builder: (context) => MomentsScreen());
      //  Make sure to cast args to the
      //  right type with the 'as' keyword like
      //  with 'Specie here for the details screen.
      case '/search/details':
        return MaterialPageRoute(
            builder: (context) => StreamProvider<List<SpeciesDetail>>.value(
                  value: context.read<FirestoreService>().getFavorites(),
                  initialData: [],
                  catchError: (context, error) {
                    print(error);
                    return [];
                  },
                  child: FutureBuilder(
                    future: context
                        .read<SpeciesList>()
                        .getSpeciesDetail((args as Specie).taxonId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SpeciesDetailsScreen(
                          specie: args as Specie,
                          speciesDetail: snapshot.data as SpeciesDetail,
                        );
                      } else {
                        return Center(child: CupertinoActivityIndicator());
                      }
                    },
                  ),
                ));
      case '/excursions':
        return MaterialPageRoute(builder: (context) => ExcursionsScreen());
      case '/excursions/saved':
        return MaterialPageRoute(
            builder: (context) => StreamProvider<List<Excursion>>.value(
                value: context.read<FirestoreService>().getExcursions(),
                initialData: [],
                catchError: (context, error) {
                  print(error);
                  return [];
                },
                child: SavedExcursionsScreen()));
      case '/excursions/search':
        return MaterialPageRoute(
            builder: (context) => ExcursionsSearchScreen());
      case '/favorites':
        return MaterialPageRoute(
            builder: (context) => StreamProvider<List<SpeciesDetail>>.value(
                  value: context.read<FirestoreService>().getFavorites(),
                  initialData: [],
                  catchError: (context, error) {
                    print(error);
                    return [];
                  },
                  child: FavoritesScreen(),
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('404 Page not found!'),
        ),
      );
    });
  }
}
