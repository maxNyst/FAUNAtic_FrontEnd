import 'package:faunatic_front_end/Screens/Login/Components/faunatic_rich_text.dart';
import 'package:flutter/material.dart';
import 'Components/login_form_fields.dart';
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
        title: FaunaticRichText(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Logo(),
            LoginFormFields(),
          ],
        ),
      ),
    );
  }
}
