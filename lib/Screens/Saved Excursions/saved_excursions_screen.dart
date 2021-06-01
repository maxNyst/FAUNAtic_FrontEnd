import 'package:faunatic_front_end/Screens/Lecture/lecture_screen.dart';
import 'package:faunatic_front_end/excursion_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../alert_dialog.dart';
import '../../widgets.dart';

class SavedExcursionsScreen extends StatefulWidget {
  const SavedExcursionsScreen({Key key}) : super(key: key);

  @override
  _SavedExcursionsScreenState createState() => _SavedExcursionsScreenState();
}

class _SavedExcursionsScreenState extends State<SavedExcursionsScreen> {
  CreatedBy _person = CreatedBy.Mig;

  @override
  Widget build(BuildContext context) {
    var excursions = Provider.of<List<Excursion>>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                child: Text(
                  'Skapade av',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Row(
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
            ),
            Row(
              children: [
                Transform.translate(
                  offset: Offset(50, -10),
                  child: Container(
                    width: 75,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Transform.translate(
                  offset: Offset(183, -10),
                  child: Container(
                    width: 75,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Sök bland utflykter',
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: excursions.length,
                  itemBuilder: (context, index) {

                    return ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LectureDetailsScreen(excursion: excursions[index],),)),
                      title: Text(excursions[index].toString()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class LectureDetailsScreen extends StatelessWidget {
  final Excursion excursion;
  const LectureDetailsScreen({Key key,@required this.excursion}) : super(key: key);

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
                    child: Form(

                      child: TextField(
                        decoration: InputDecoration(
                          labelText: excursion.name,
                            hintText: 'Namnge din utflykt',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            fillColor: Colors.grey.shade300,
                            filled: true),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(alignment: Alignment.bottomCenter, children: [
                    Padding(padding: const EdgeInsets.only(bottom: 40.0)),
                    SizedBox(
                      height: 225, // constrain height
                      child: Column(
                        children: [
                          FaunaticListTile(
                            onTap: () {},
                            color: Colors.orangeAccent,
                            icon: Icon(
                              Icons.add_location,
                              size: 22,
                            ),
                            child: Text(
                              excursion.location.place,
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
              ),
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
                    onPressed: () {},
                    child: Text(
                      'Starta',
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


enum CreatedBy { Mig, Andra }
