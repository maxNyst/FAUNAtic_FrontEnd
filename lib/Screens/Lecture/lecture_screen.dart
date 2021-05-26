import 'package:flutter/material.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key key}) : super(key: key);

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
        actions: [
        ],
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
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 12),
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
                              )
                          ),
                          onPressed: () {
                            print('knappen funkar');
                          },
                          child: Text('Avbryt', style: TextStyle(fontSize: 16),)
                      )
                  ),
                  SizedBox(
                      width: 115.0,
                      height: 45.0,
                      child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              )
                          ),
                          onPressed: () {
                            print('knappen funkar');
                          },
                          child: Text('Spara', style: TextStyle(fontSize: 16),)
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlanExcursionButtons extends StatelessWidget {
  const PlanExcursionButtons({
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
                          'Plats',
                          style: TextStyle(fontSize: 18),
                        ),
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
                      onTap: () => Navigator.pushNamed(context, '/excursions/assignment'),
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
              ),]
        ),
      ],
    );
  }
}@override
Widget build(BuildContext context) {
  const topPadding = 0.0;
  var size = MediaQuery.of(context).size;

  return Scaffold(
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: null,
    //   label: Text('Save'),
    // ),
    appBar: AppBar(
      actions: [
      ],
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
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12),
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
                            )
                        ),
                        onPressed: () {
                          print('knappen funkar');
                        },
                        child: Text('Avbryt', style: TextStyle(fontSize: 16),)
                    )
                ),
                SizedBox(
                    width: 115.0,
                    height: 45.0,
                    child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            )
                        ),
                        onPressed: () {
                          print('knappen funkar');
                        },
                        child: Text('Spara', style: TextStyle(fontSize: 16),)
                    )
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
