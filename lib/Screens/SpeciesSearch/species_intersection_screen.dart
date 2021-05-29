import 'package:flutter/material.dart';

import '../../widgets.dart';

class IntersectionScreen extends StatelessWidget {
  const IntersectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaunaticListTile(
                      text: 'Sök efter arter',
                      onTap: () => Navigator.pushNamed(context, '/search'),
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 15.0, right: 8.0, bottom: 8.0),
                  child: FaunaticListTile(
                    text: 'Mina favoriter',
                    color: Colors.greenAccent,
                    onTap: () => {},
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
