import 'package:flutter/material.dart';
import '../../widgets.dart';

class ExcursionsScreen extends StatelessWidget {
  const ExcursionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              'Utflykter',
              style: TextStyle(color: Colors.black, fontSize: 45),
            ),
          ),
          Image.asset(
            'assets/images/Forest-panaV2.png',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExcursionButtons(),
          ),
        ],
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
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              FaunaticListTile(
                text: 'Planera Utflykt',
                color: Colors.orangeAccent,
                onTap: () => Navigator.pushNamed(context, '/lectures'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: FaunaticListTile(
                  text: 'Sparade Utflykter',
                  color: Colors.greenAccent,
                  onTap: () => Navigator.pushNamed(context, '/excursions/saved'),
                ),
              ),
              FaunaticListTile(
                text: 'Utforska Utflykter',
                color: Colors.redAccent,
                onTap: () => print('knappen funkar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
