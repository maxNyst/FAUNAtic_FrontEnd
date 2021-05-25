import 'package:faunatic_front_end/authentication_service.dart';
import 'package:faunatic_front_end/route_generator.dart';
import 'package:faunatic_front_end/species_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:faunatic_front_end/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:faunatic_front_end/Screens/Home/home_screen.dart';

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
      ],
      child: MaterialApp(
        title: 'Faunatic the fabulous',
        // Here is the color theme and text themes.
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.green.shade50,
          primaryColor: Colors.green.shade100,
          primarySwatch: Colors.green,
          accentColor: Colors.green.shade800,
          outlinedButtonTheme:
              OutlinedButtonThemeData(style: roundedButtonStyle),
          elevatedButtonTheme:
              ElevatedButtonThemeData(style: roundedButtonStyle),
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
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
      return HomeScreen();
    }
    return LoginScreen();
  }
}
