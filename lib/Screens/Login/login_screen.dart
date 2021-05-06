import 'package:flutter/material.dart';

import 'Components/logo.dart';

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
      body: SingleChildScrollView(
        child: Logo(),
      ),
    );
  }
}
