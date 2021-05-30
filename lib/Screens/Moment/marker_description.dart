import 'package:flutter/material.dart';

class MarkerDescription extends StatefulWidget {
  final String placeTitle;
  MarkerDescription({Key key, String placeTitle}) :
        placeTitle = placeTitle,
        super(key: key);

  @override
  _MarkerDescriptionState createState() => _MarkerDescriptionState(placeTitle);
}

class _MarkerDescriptionState extends State<MarkerDescription> {
  String placeTitle;
  final _formKey = GlobalKey<FormState>();
  var _title, _body, _image;

  _MarkerDescriptionState(String placeTitle) {
    this.placeTitle = placeTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lägg till beskrivning'),
        centerTitle: true,
        /*leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.pop(context, null),
        ),*/
        actions: [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              var formState = _formKey.currentState;
              if (formState.validate()) {
                formState.save();
                Navigator.pop(context,
                    NoteModel(title: _title, body: _body, image: _image));
              }
            },
            child: Text('SPARA'),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (title) => _title = title,
              textCapitalization: TextCapitalization.words,
              validator: (text) {
                return text.trim().isEmpty ? 'Saknar titel' : null;
              },
              decoration: InputDecoration(
                hintText: '$placeTitle',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
            Divider(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: 10,
                onSaved: (body) => _body = body,
                textCapitalization: TextCapitalization.sentences,
                validator: (text) {
                  return text.trim().isEmpty ? 'Saknar anteckningskropp' : null;
                },
                decoration: InputDecoration(
                  hintText: 'Beskrivning',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 2),
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).accentColor, width: 1),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class NoteModel {
  String title;
  String body;
  Image image;

  NoteModel({this.title, this.body, this.image});
}
