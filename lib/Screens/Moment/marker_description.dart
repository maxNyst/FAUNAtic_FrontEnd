import 'package:faunatic_front_end/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarkerDescription extends StatefulWidget {
  final Map markerMap;
  MarkerDescription({Key key, Map markerMap}) :
        markerMap = markerMap,
        super(key: key);

  @override
  _MarkerDescriptionState createState() => _MarkerDescriptionState(markerMap);
}

class _MarkerDescriptionState extends State<MarkerDescription> {
  Map markerMap;
  final _formKey = GlobalKey<FormState>();
  var _title, _body;

  _MarkerDescriptionState(Map markerMap) {
    this.markerMap = markerMap;
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
            style: TextButton.styleFrom(primary: Colors.green),
            onPressed: () {
              var formState = _formKey.currentState;
              if (formState.validate()) {
                formState.save();
                /*Provider.of<FirestoreService>(context, listen: false).userRef.collection('Temp').doc('Marker_$markerCounter').update({
                  'Name': '$_title',
                  'Description': '$_body',
                });*/
                Navigator.pop(context,
                    NoteModel(title: _title, body: _body));
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
                hintText: 'Titel',
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

  NoteModel({this.title, this.body});
}
