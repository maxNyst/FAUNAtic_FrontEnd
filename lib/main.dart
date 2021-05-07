import 'package:faunatic_front_end/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faunatic the fabulous',
      // Here is the color theme and text themes.
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green.shade300,
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        accentColor: Colors.orangeAccent,
      ),
      home: Login(),
    );
  }
}

  //}



