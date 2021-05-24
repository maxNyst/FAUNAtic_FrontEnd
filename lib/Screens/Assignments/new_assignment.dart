import 'package:flutter/material.dart';

class NewAssignmentScreen extends StatelessWidget {
  const NewAssignmentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
        ],
        title: Text('Hem'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/Notebook-rafiki.png',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: 'Ny uppgift',
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
              ),
              Icon(
                Icons.add_circle,
                    size: 24,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}