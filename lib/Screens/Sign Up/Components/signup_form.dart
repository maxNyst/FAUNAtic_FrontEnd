import 'package:faunatic_front_end/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  validator: (email) {
                    if (email.contains('@') && email.contains('.')) {
                      return null;
                    } else {
                      return 'Not a valid email.';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (password) {
                    if (password.length < 6) {
                      return 'Password too short. It needs to be a minimum of 6 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _confirmPassword,
                  validator: (password) {
                    if (password != _passwordController.text) {
                      return "Passwords don't match";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password'),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    var email = _emailController.text;
                    var password = _confirmPassword.text;
                    var authResponse = context
                        .read<AuthenticationService>()
                        .signUp(email: email, password: password);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: FutureBuilder(
                          future: authResponse,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text(snapshot.error);
                            } else if (snapshot.hasData) {
                              return Text(snapshot.data);
                            } else {
                              return Text('something went wrong');
                            }
                          },
                        ),
                      ),
                    );
                    authResponse.whenComplete(() => Navigator.pop(context));
                  }
                },
                child: Text(
                  'Create Account',
                ),
                /* onPressed: () => onPressed {
                  if(!_formKey.currentState.validate()){
                    return;
              }
                  _formKey.currentState.save();

                }*/
              )
            ],
          ),
        ),
      ),
    );
  }
}
