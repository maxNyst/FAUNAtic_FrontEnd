import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.outbond_outlined),
              onPressed: () => context.read<AuthenticationService>().signOut())
        ],
        title: Text('Logged In! Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Home'),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/search'),
                child: Text('Search Screen')),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/lectures'),
                child: Text('Lectures Screen'))
          ],

        ),
      ),
    );
  }
}
