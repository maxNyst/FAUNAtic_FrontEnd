import 'dart:ffi';

import 'package:flutter/material.dart';

class ExcursionsScreen extends StatelessWidget {
  const ExcursionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                'assets/Forest-pana.png',
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Utflykter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ExcursionButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

class ExcursionButtons extends StatelessWidget {
  const ExcursionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'detta är en hintText'),
        ),
        ElevatedButton(
          onPressed: () {
            print('knappen funkar');
          },
          child: Text('ElevatedButton'),
        ),
        OutlinedButton(
          onPressed: () {
            print('knappen funkar');
          },
          child: Text('OutlinedButton'),
        ),
      ],
    );
  }
}
