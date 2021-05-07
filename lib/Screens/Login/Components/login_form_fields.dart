import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Username or Email"),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
            ),
            child: TextFormField(
              validator: _passwordValidator,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
          ),
          TextButton(
            child: Text('Login'),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  String _passwordValidator(String value) {
    if (value.trim().isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
