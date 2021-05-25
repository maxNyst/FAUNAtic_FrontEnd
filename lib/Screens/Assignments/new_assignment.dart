import 'package:flutter/material.dart';

class NewAssignmentScreen extends StatelessWidget {
  const NewAssignmentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,

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
                'assets/Notebook-rafikiV2.png',
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: SizedBox(
            width: 115.0,
            height: 45.0,
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xff5ECD9E),
              foregroundColor: Colors.white,
              onPressed: () {
                print('knappen funkar');
              },
              label: Text('Spara'),
            ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: SizedBox(
            width: 115.0,
            height: 45.0,
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xff5ECD9E),
              foregroundColor: Colors.white,
              onPressed: () {
                // Respond to button press
              },
              label: Text('Spara'),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
