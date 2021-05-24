import 'package:flutter/material.dart';

class ExcursionsScreen extends StatelessWidget {
  const ExcursionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
        ],
        title: Text('Hem'),
      ),
    );
  }
}