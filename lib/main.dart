import 'package:faunatic_front_end/Screens/Sign%20Up/signup_screen.dart';
import 'package:faunatic_front_end/Screens/SpeciesSearch/search_screen.dart';
import 'package:faunatic_front_end/authentication_service.dart';
import 'package:faunatic_front_end/species_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:faunatic_front_end/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Excursions Search/excursions_search_screen.dart';
import 'Screens/Excursions/excursions_screen.dart';
import 'Screens/Home/home_screen.dart';
import 'Screens/Lecture/lecture_screen.dart';
import 'Screens/Moment/moments_screen.dart';
import 'Screens/Saved Excursions/saved_excursions_screen.dart';
import 'Screens/Species Detail/species_detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Use this line in your build method if you need access
    // to relative size parameters, independent of screen size:
    // Size size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider<SpeciesList>(
          create: (context) => SpeciesList(),
        ),
      ],
      child: MaterialApp(
        title: 'Faunatic the fabulous',
        // Here is the color theme and text themes.
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.green.shade50,
          primaryColor: Colors.green.shade400,
          primarySwatch: Colors.green,
          accentColor: Colors.green.shade800,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)))
                // elevation: MaterialStateProperty.all(4.0),
                ),
          ),
        ),
        initialRoute: '/',
        routes: {
          // add all screens here
          '/': (context) => AuthenticationWrapper(),
          '/home': (context) => Home(),
          '/signup': (context) => SignupScreen(),
          '/search': (context) => SpeciesSearch(),
          '/lectures': (context) => LecturesScreen(),
          '/details': (context) => SpeciesDetailsScreen(),
          '/moment': (context) => MomentsScreen(),
          '/excursions': (context) => ExcursionsScreen(),
          '/saved_excursions': (context) => SavedExcursionsScreen(),
          '/excursions_search': (context) => ExcursionsSearchScreen()
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return Home();
    }
    return Login();
  }
}
