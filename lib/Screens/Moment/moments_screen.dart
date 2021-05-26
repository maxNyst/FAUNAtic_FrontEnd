import 'package:flutter/material.dart';

class MomentsScreen extends StatelessWidget {
  const MomentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Hem'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Planera innehåll',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
          Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 10,
            endIndent: 200,
          ),
          Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 250),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    hintText: 'Text...',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    fillColor: Colors.grey.shade100,
                    filled: true),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                )),
            onPressed: () {
              print('knappen funkar');
            },
            child: Text(
              'Avbryt',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF5ECD9E),
              foregroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                Icons.add,
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
