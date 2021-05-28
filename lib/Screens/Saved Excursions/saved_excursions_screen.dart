import 'dart:ffi';

import 'package:flutter/material.dart';

class SavedExcursionsScreen extends StatelessWidget {
  const SavedExcursionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.outbond_outlined), onPressed: () {},
          )
        ],
        title: Text('Hem'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 225,
              width: 225,
              child: Image.asset(
                'assets/Hiking-amico.png',
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Skapade av', style: TextStyle(fontSize: 22),),
              ),
            ),

            RadioButtons(),

            Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),

            ExcursionButtons(),

            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              child: SizedBox(
                  width: 115.0,
                  height: 45.0,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          )
                      ),
                      onPressed: () {
                        print('knappen funkar');
                      },
                      child: Text('Avbryt', style: TextStyle(fontSize: 16),)
                  )
              ),
            )
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
        Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(padding: const EdgeInsets.only(bottom: 40.0)),
              SizedBox(
                height: 225, // constrain height
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
                      onTap: () =>
                          Navigator.pushNamed(
                              context, '/lectures'),
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
            ]
        ),
      ],
    );
  }
}

enum CreatedBy { Mig, Andra }

/// This is the stateful widget that the main application instantiates.
class RadioButtons extends StatefulWidget {
  const RadioButtons({Key key}) : super(key: key);

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonsState extends State<RadioButtons> {
  CreatedBy _person = CreatedBy.Mig;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<CreatedBy>(
            title: const Text('Mig'),
            value: CreatedBy.Mig,
            groupValue: _person,
            onChanged: (CreatedBy value) {
              setState(() {
                _person = value;
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile<CreatedBy>(
            title: const Text(' Andra '),
            value: CreatedBy.Andra,
            groupValue: _person,
            onChanged: (CreatedBy value) {
              setState(() {
                _person = value;
              });
            },
          ),
        ),
      ],
    );
  }
}



