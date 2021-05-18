import 'package:flutter/material.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const topPadding = 22.0;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: null,
      //   label: Text('Save'),
      // ),

      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/Teacher-pana.png',
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  'Plan your excursion',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                      Padding(
                        padding: const EdgeInsets.only(top: topPadding),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Place',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topPadding),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Structured moments',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topPadding),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Student tasks',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                print('student tasks');
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: topPadding*3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Back'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Save'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
