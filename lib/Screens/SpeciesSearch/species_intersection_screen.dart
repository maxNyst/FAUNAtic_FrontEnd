import 'dart:ffi';

import 'package:flutter/material.dart';

class IntersectionScreen extends StatelessWidget {
  const IntersectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.outbond_outlined),
            onPressed: () {},
          )
        ],
        title: Text('Hem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Arter',
                    style: TextStyle(color: Colors.black, fontSize: 45),
                  )),
            ),
            SizedBox(
              height: 240,
              child: Image.asset(
                'assets/Wilderness-pana.png',
              ),
            ),
            SpeciesButtons(),
          ],
        ),
      ),
    );
  }
}

class SpeciesButtons extends StatelessWidget {
  const SpeciesButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Padding(padding: const EdgeInsets.only(bottom: 40.0)),
          SizedBox(
            height: 225, // constrain height
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Transform.translate(
                          offset: Offset(-10, 0),
                          child: Container(
                            height: 70,
                            width: 6,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        title: Transform.translate(
                          offset: Offset(-45, 0),
                          child: Text(
                            'Sök efter arter',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        trailing: Transform.translate(
                          offset: Offset(-10, 0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, '/search'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 15.0, right: 8.0, bottom: 8.0),
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: Transform.translate(
                        offset: Offset(-10, 0),
                        child: Container(
                          height: 100,
                          width: 6,
                          color: Colors.greenAccent,
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-45, 0),
                        child: Text(
                          'Mina favoriter',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: Offset(-10, 0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ),
                      onTap: () =>{},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
