import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication_service.dart';

class LoginFormFields extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginFormFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Username or Email"),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
            ),
            child: TextFormField(
              controller: _passwordController,
              validator: _passwordValidator,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          TextButton(
            child: Text('Sign in'),
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
            },
          ),
        ],
      ),
    );
  }

  String _passwordValidator(String password) {
    if (password.trim().isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
