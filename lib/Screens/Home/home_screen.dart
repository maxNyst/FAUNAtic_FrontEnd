import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';


class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In! FUCK YEAH'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          child: Text(
            'Sign out',
          ),
        ),
      ),
    );
  }
}