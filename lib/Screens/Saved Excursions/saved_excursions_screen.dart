import 'package:flutter/material.dart';

class SavedExcursionsScreen extends StatelessWidget {
  const SavedExcursionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            RadioButtons(),
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
          ],
        ),
      ),
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
