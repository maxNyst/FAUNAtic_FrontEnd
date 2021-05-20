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
        SizedBox(
          height: 300, // constrain height
          child: ListView(
            itemExtent: 100.0, //control size
            children: [
              ListTile(
                title: Text('Planera Utflykt', textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('knappen funkar');
                },
              ),
              ListTile(
                title: Text('Sparade Utflykter', textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('knappen funkar');
                },
              ),
              ListTile(
                title: Text('Utforska Utflykter', textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('knappen funkar');
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
