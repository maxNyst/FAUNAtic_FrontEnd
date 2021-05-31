import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faunatic_front_end/alert_dialog.dart';
import 'package:faunatic_front_end/excursion_model.dart';
import 'package:faunatic_front_end/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets.dart';

import 'map_screen.dart';

class LecturesScreen extends StatefulWidget {
  const LecturesScreen({Key key}) : super(key: key);

  @override
  _LecturesScreenState createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Teacher-panaV2.png',
              width: size.width * 0.8,
            ),
            Text(
              'Planera din utflykt',
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: 'Namnge din utflykt',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          fillColor: Colors.grey.shade300,
                          filled: true),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlanExcursionButtons(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 115.0, height: 45.0, child: FaunaticAlert()),
                SizedBox(
                  width: 115.0,
                  height: 45.0,
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    )),
                    onPressed: () async {
                      final name = _nameController.text;
                      final docSnapShot =
                          await context.read<FirestoreService>().userRef.get();
                      Map location = docSnapShot.data();
                      final googleMaps = GoogleMaps.fromJson(location);
                      final momentsList = context.read<List>();
                      await context
                          .read<FirestoreService>()
                          .addExcursion(name, googleMaps, momentsList.map((e) => e.toJson()).toList()).onError(
                              (error, stackTrace) =>
                                  print(error.toString() + ' <= denna?'));
                      // momentsList.clear();
                      // await context.read<FirestoreService>().userRef.set(null);
                    },
                    child: Text(
                      'Spara',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PlanExcursionButtons extends StatefulWidget {
  const PlanExcursionButtons({Key key}) : super(key: key);

  @override
  _PlanExcursionButtonsState createState() => _PlanExcursionButtonsState();
}

class _PlanExcursionButtonsState extends State<PlanExcursionButtons> {
  String place;
  MaterialPageRoute mpr;

  void state() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    /*DocumentSnapshot<Map<String, dynamic>> ref;
    Provider.of<FirestoreService>(context).userRef.get().then((value) => {
          ref = value,
          print(ref.data().toString()),
          if (ref == null ||
              ref.data().isEmpty ||
              ref.data()['Place'].toString().isEmpty)
            {
              place = '',
              print('1 ' + place),
            }
          else if (ref.data().containsKey('Place') &&
              ref.data()['Place'] != place)
            {
              place = ref.data()['Place'],
              print('2 ' + place),
              state(),
            }
        });*/

    return Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Padding(padding: const EdgeInsets.only(bottom: 40.0)),
          SizedBox(
            height: 225, // constrain height
            child: Column(
              children: [
                FaunaticListTile(
                  onTap: () {
                    print('knappen funkar');
                    Navigator.push(
                      context,
                      mpr = MaterialPageRoute(
                        builder: (context) {
                          return MapScreen();
                        },
                      ),
                    );
                    mpr.popped.then((value) => {
                          place = value
                              .toString()
                              .substring(1, value.toString().indexOf(']')),
                          state(),
                        });
                  },
                  color: Colors.orangeAccent,
                  icon: Icon(
                    Icons.add_location,
                    size: 22,
                  ),
                  child: place == null || place.trim().isEmpty
                      ? Text(
                          'Område',
                          style: TextStyle(fontSize: 18),
                        )
                      : Text(
                          '$place',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: FaunaticListTile(
                    text: 'Planering',
                    color: Colors.redAccent,
                    onTap: () =>
                        Navigator.pushNamed(context, '/excursions/moment'),
                  ),
                ),
                FaunaticListTile(
                  text: 'Utflyktsuppgifter',
                  color: Colors.greenAccent,
                  onTap: () =>
                      Navigator.pushNamed(context, '/excursions/assignment'),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
