import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/signup_form.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Skapa konto'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.1,
          ),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                    text: 'JOIN',
                    style: GoogleFonts.ralewayDots(
                        textStyle: Theme.of(context).textTheme.headline2,
                        fontWeight: FontWeight.w900,
                        fontSize: 35)),
              ),
              RichText(
                text: TextSpan(
                  text: 'FAUNA',
                  style: GoogleFonts.ralewayDots(
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontWeight: FontWeight.w700,
                      fontSize: 55),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'tic',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 55),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Naturlig planering, var du än är.',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 17),
                ),
              ),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
