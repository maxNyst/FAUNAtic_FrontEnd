import 'package:flutter/material.dart';

class CustomNote extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CustomNote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ny Anteckning'),
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.pop(context, null),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(
              context,
            ),
            style: TextButton.styleFrom(primary: Colors.white),
            child: Text('SPARA'),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Titel',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Anteckning',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
            )
          ],
        ),
      ),
    );
  }
}

class NoteModel {
  String title;
  String body;
  Image image;

  NoteModel(this.title, this.body, this.image);
}
