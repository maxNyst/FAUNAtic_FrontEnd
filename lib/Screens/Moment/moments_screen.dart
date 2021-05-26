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
                'Planera moment',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ÄNDRA TILL DET NAMN SOM STÄLLS IN', //Placeholder namn
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
          Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                hintText: 'Momentnamn...',
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                fillColor: Colors.grey.shade200,
                filled: true),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Lägg till innehåll',
                style: TextStyle(color: Colors.black, fontSize: 15),
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
          SizedBox(
            width: 115.0,
            height: 45.0,
            child: OutlinedButton(
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
          ),

          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF5ECD9E),
                foregroundColor: Colors.white,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  size: 40.0,
                ),
              )),
        ],
      ),
    );
  }
}
