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
                      return 'Epostadressen har felaktigt format';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Epost'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (password) {
                    if (password.length < 6) {
                      return 'Måste innehålla minst 6 symboler';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Lösenord'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _confirmPassword,
                  validator: (password) {
                    if (password != _passwordController.text) {
                      return "Lösenorden måste matcha";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Bekräfta lösenord'),
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
                              return Text('Laddar...');
                            }
                          },
                        ),
                      ),
                    );
                    authResponse.whenComplete(() => Navigator.pop(context));
                  }
                },
                child: Text(
                  'Skapa konto',
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
