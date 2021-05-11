import 'package:faunatic_front_end/Screens/Sign%20Up/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication_service.dart';

class LoginForm extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginForm({Key key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              validator: (email) {
                if (email.contains('@') && email.contains('.'))
                  return null;
                else
                  return 'Not a valid email.';
              },
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
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Sign in',
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();
                  context.read<AuthenticationService>().signIn(
                        email: email,
                        password: password,
                      );
                }
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Don't have an account? Sign up here",
              ),
            )
          ],
        ),
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