import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faunatic',
        ),
      ),
      body: Center(
        child: Image.asset("assets/images/logo.png",
        color: Theme.of(context).accentColor,),
      ),
    );
  }
}
