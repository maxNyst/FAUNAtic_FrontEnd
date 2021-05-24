import 'Components/faunatic_rich_text.dart';
import 'package:flutter/material.dart';
import 'Components/login_form.dart';
import 'Components/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use this line if you need access to relative
    // size parameters independent of screen size:
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Logo(),
              ),
              Center(
                child: FaunaticRichText(
                  fontSize: 45.0,
                ),
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
