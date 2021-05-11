import 'package:faunatic_front_end/Screens/Sign%20Up/signup_form_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication_service.dart';

class LoginFormFields extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();

  LoginFormFields({Key key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          SizedBox(height: 20),
            ElevatedButton(
            child: CupertinoButton(
              child: Text('Sign in',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
              ),
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
              },
            ),
          ),
          SizedBox(height: 20),
            ElevatedButton(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupFormFields(usernameController: _usernameController, emailController: _emailController, passwordController: _passwordController, confirmPassword: _confirmPassword);
                    },
                  ),
                );
              },
              child: Text(
                  "Don't have an account? Sign up here",
              style: TextStyle(color: Colors.orangeAccent, fontSize: 16)
              ),
            ),
          )
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

