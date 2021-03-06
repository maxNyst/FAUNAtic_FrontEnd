import 'package:faunatic_front_end/Screens/Sign%20Up/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication_service.dart';

class EmailValidate {
  static String validate(String email) {
      if (email.contains('@') && email.contains('.')) {
        return null;
      } else {
        return 'Epostadressen har felaktigt format.';
      }
    }
  }

  class PasswordValidate {
    static String passwordValidate(String password) {
      if (password.trim().isEmpty) {
        return 'Lösenord krävs.';
      }
      return null;
    }
  }

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                validator: EmailValidate.validate,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Epost'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: TextFormField(
                  controller: _passwordController,
                  validator: PasswordValidate.passwordValidate,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lösenord',
                  ),
                ),
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    var email = _emailController.text.trim();
                    var password = _passwordController.text.trim();
                    context.read<AuthenticationService>().signIn(
                          email: email,
                          password: password,
                        );
                  }
                },
                child: Text(
                  'Logga in',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  "Har du inget konto? Skapa ett här.",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
