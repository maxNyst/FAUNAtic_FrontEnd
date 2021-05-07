import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Image(

            isAntiAlias: true,
            image: AssetImage("assets/images/logo.png"),
            color: Colors.orangeAccent,
          ),
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'FAUNA',
              style: TextStyle(fontSize: 40),
              children: <TextSpan>[
                TextSpan(
                    text: 'tic',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}