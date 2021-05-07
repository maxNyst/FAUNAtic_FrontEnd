import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaunaticRichText extends StatelessWidget {
  final fontSize;

  FaunaticRichText({
    Key key,
    this.fontSize = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Fauna',
        style: GoogleFonts.ralewayDots(
            fontSize: fontSize,
            textStyle: Theme.of(context).textTheme.headline2,
            fontWeight: FontWeight.w900),
        children: <TextSpan>[
          TextSpan(
              text: 'tic',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
