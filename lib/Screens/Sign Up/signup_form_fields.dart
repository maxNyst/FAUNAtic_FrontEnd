import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../authentication_service.dart';

class SignupFormFields extends StatelessWidget {
  const SignupFormFields({
    Key key,
    @required TextEditingController usernameController,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required TextEditingController confirmPassword,
  }) : _emailController = emailController, _passwordController = passwordController, _confirmPassword = confirmPassword, super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPassword;

 // bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body:
      Container(
        margin: EdgeInsets.all(24),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
          text: TextSpan(
          text: 'JOIN FAUNA',
            style: GoogleFonts.ralewayDots(
                textStyle: Theme.of(context).textTheme.headline1,
                fontWeight: FontWeight.w700, fontSize: 55),
            children: <TextSpan>[
              TextSpan(
                  text: 'tic',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold, fontSize: 55)),
            ],
          ),
                textAlign: TextAlign.center,
        ),
              Padding(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child:
                  Text('Teaching has never been more easy',
                      style: TextStyle(color: Colors.white60, fontSize: 17))),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: _confirmPassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Confirm Password"),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 17),
                ),
                /* onPressed: () => onPressed {
                  if(!_formKey.currentState.validate()){
                    return;
              }
                  _formKey.currentState.save();

                }*/)
            ],
          ),
        ),
      ),
    );
  }
}

