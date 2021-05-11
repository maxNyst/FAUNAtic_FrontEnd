import 'package:flutter/material.dart';
import 'faunatic_rich_text.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
              heightFactor: 1.2,
              child: Image.asset(
                'assets/images/logo.png',
                color: Colors.green,
                isAntiAlias: true,
                height: 250,
                width: 180,
                scale: 0.1,
                filterQuality: FilterQuality.high,
              )),
        ),
        Center(
          child: FaunaticRichText(
            fontSize: 45.0,
          ),
        ),
      ],
    );
  }
}
