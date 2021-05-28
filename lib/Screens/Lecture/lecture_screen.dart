import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faunatic_front_end/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'map_screen.dart';

class LecturesScreen extends StatefulWidget {
  const LecturesScreen({Key key}) : super(key: key);

  @override
  _LecturesScreenState createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  @override
  Widget build(BuildContext context) {
    const topPadding = 0.0;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: null,
      //   label: Text('Save'),
      // ),
      appBar: AppBar(
        actions: [],
        title: Text('Hem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Teacher-panaV2.png',
              width: size.width * 0.8,
            ),
            Text(
              'Planera din exkursion',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Excursion name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          fillColor: Colors.blueGrey.shade300,
                          filled: true),
                    ),
                  ),
                ],
              ),
            ),
            PlanExcursionButtons(),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 115.0,
                      height: 45.0,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          )),
                          onPressed: () {
                            print('knappen funkar');
                          },
                          child: Text(
                            'Avbryt',
                            style: TextStyle(fontSize: 16),
                          ))),
                  SizedBox(
                      width: 115.0,
                      height: 45.0,
                      child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          )),
                          onPressed: () {
                            print('knappen funkar');
                          },
                          child: Text(
                            'Spara',
                            style: TextStyle(fontSize: 16),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlanExcursionButtons extends StatefulWidget {
  const PlanExcursionButtons({
    Key key,
  }) : super(key: key);

  @override
  _PlanExcursionButtonsState createState() => _PlanExcursionButtonsState();
}

class _PlanExcursionButtonsState extends State<PlanExcursionButtons> {
  String place;

  void state() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot<Map<String, dynamic>> ref;
    Provider.of<FirestoreService>(context).userRef.get().then((value) => {
          ref = value,
          if (ref == null || ref.data().isEmpty)
            {
              place = null,
            }
          else if (ref.data().containsKey('Place'))
            {
              place = ref.data()['Place'],
              state(),
            }
        });

    return Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
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
                  title: Row(
                    children: [
                      Transform.translate(
                        offset: Offset(-45, 0),
                        child: place == null
                            ? Text(
                                'Plats',
                                style: TextStyle(fontSize: 18),
                              )
                            : Text(
                                '$place',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                                overflow: TextOverflow.ellipsis,
                              ),
                      )
                    ],
                  ),
                  trailing: Transform.translate(
                    offset: Offset(-20, 0),
                    child: Icon(
                      Icons.add_location,
                      size: 22,
                    ),
                  ),
                  onTap: () {
                    print('knappen funkar');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MapScreen(peb: widget);
                        },
                      ),
                    );
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
                      'Utflyktsuppgifter',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  trailing: Transform.translate(
                    offset: Offset(-20, 0),
                    child: Icon(
                      Icons.add,
                      size: 22,
                    ),
                  ),
                  onTap: () =>
                      Navigator.pushNamed(context, '/excursions/assignment'),
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
                      'Moment',
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
                      Navigator.pushNamed(context, '/excursions/moment'),
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
        ]),
      ],
    );
  }
}

@override
Widget build(BuildContext context) {
  const topPadding = 0.0;
  var size = MediaQuery.of(context).size;

  return Scaffold(
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: null,
    //   label: Text('Save'),
    // ),
    appBar: AppBar(
      actions: [],
      title: Text('Hem'),
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/Teacher-panaV2.png',
            width: size.width,
          ),
          Text(
            'Planera din exkursion',
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Excursion name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        fillColor: Colors.blueGrey.shade300,
                        filled: true),
                  ),
                ),
              ],
            ),
          ),
          PlanExcursionButtons(),
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 115.0,
                    height: 45.0,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        )),
                        onPressed: () {
                          print('knappen funkar');
                        },
                        child: Text(
                          'Avbryt',
                          style: TextStyle(fontSize: 16),
                        ))),
                SizedBox(
                    width: 115.0,
                    height: 45.0,
                    child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        )),
                        onPressed: () {
                          print('knappen funkar');
                        },
                        child: Text(
                          'Spara',
                          style: TextStyle(fontSize: 16),
                        ))),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
