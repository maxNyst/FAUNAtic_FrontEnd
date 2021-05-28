import 'package:faunatic_front_end/Screens/Saved%20Excursions/saved_excursions_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faunatic_front_end/authentication_service.dart';
import 'package:faunatic_front_end/excursion_model.dart';
import 'package:faunatic_front_end/firestore_service.dart';
import 'package:faunatic_front_end/route_generator.dart';
import 'package:faunatic_front_end/species_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:faunatic_front_end/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Assignments/new_assignment.dart';
import 'Screens/Excursions/excursions_screen.dart';
import 'Screens/Google Classroom/googleclassroom.dart';
import 'Screens/Home/home_screen.dart';
import 'Screens/Lecture/lecture_screen.dart';
import 'Screens/Lecture/saved_lectures_screen.dart';
import 'package:faunatic_front_end/Screens/Home/home_screen.dart';

import 'Screens/Moment/moments_screen.dart';
import 'Screens/Sign Up/signup_screen.dart';
import 'Screens/SpeciesSearch/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final roundedButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Use this line in your build method if you need access
    // to relative size parameters, independent of screen size:
    // var size = MediaQuery.of(context).size;
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
        Provider<FirestoreService>(
          create: (context) => FirestoreService(FirebaseFirestore.instance),
        ),
        Provider<List>(
          create: (context) => [],
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Faunatic the fabulous',
        // Here is the color theme and text themes.
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.green,
            primaryColor: Colors.grey[100],
            accentColor: Colors.green,
            primaryIconTheme: IconThemeData(color: Colors.green),
            iconTheme: IconThemeData(color: Colors.green)),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        routes: {
          // add all screens here
          '/': (context) => AuthenticationWrapper(),
          '/home': (context) => HomeScreen(),
          '/signup':(context) => SignupScreen(),
          '/search': (context) => SpeciesSearchScreen(),
          '/lectures': (context) => LecturesScreen(),
          '/savedLectures': (context) => SavedLecturesScreen(),
          '/googleClassroom': (context) => GoogleClassroomScreen()
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
      context.read<FirestoreService>().setUser(firebaseUser);
      return HomeScreen();
    }
    return LoginScreen();
  }
}
