import 'package:faunatic_front_end/excursion_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../firestore_service.dart';

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

enum CreatedBy { Mig, Andra }
