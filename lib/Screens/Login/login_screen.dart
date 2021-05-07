import 'package:flutter/material.dart';
import 'Components/logo.dart';

class Login extends StatelessWidget {
  const Login({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use this line if you need access to relative
    // size parameters independent of screen size:
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faunatic',
        ),
      ),
      body: SingleChildScrollView(
        child: Logo(),
      ),
    );
  }
}


/*class _LogininScreen extends StatelessWidget<MyApp>{
    @override*/
Widget build(BuildContext context){
  return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(25.0
          ),
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(

                        ),
                        labelText: "Username or Email"
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password"),

                    ),
                  ),
                ],
              ),
            ),
          )
        /*children: <Widget>[
      TextField(
      decoration: InputDecoration(
      hintText: "Username",
      labelText: "Your username",
      labelStyle: TextStyle(
      fontSize: 24,
      color: Colors.white
  ),
    ),
    )
    ],*/
      )
  );
}

