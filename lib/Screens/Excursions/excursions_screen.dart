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
                      style: TextStyle(color: Colors.black, fontSize: 45),
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

            children: [
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-5, 0),
                  child: Container(
                    height: 70,
                    width: 4,
                    color: Colors.orangeAccent,
                  ),
                ),
                title: Transform.translate(
                  offset: Offset(-45, 0),
                  child: Text(
                    'Planera Utflykt',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                trailing: Transform.translate(
                  offset: Offset(-20, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                onTap: () {
                  print('knappen funkar');
                },
              ),

              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-5, 0),
                  child: Container(
                    height: 100,
                    width: 4,
                    color: Colors.greenAccent,
                  ),
                ),
                title: Transform.translate(
                  offset: Offset(-45, 0),
                  child: Text(
                    'Sparade Utflykter',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                trailing: Transform.translate(
                  offset: Offset(-20, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                onTap: () {
                  print('knappen funkar');
                },
              ),

              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-5, 0),
                  child: Container(
                    height: 100,
                    width: 4,
                    color: Colors.redAccent,
                  ),
                ),
                title: Transform.translate(
                  offset: Offset(-45, 0),
                  child: Text(
                    'Utforska Utflykter',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                trailing: Transform.translate(
                  offset: Offset(-20, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
                onTap: () {
                  print('knappen funkar');
                },
              ),

              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
