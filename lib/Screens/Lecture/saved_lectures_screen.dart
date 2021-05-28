import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedLecturesScreen extends StatelessWidget {
  SavedLecturesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Saved Lectures'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    mini: true,
                    elevation: 0.0,
                    child: Icon(Icons.arrow_back_ios,
                        color: Colors.black, size: 17.0)),
                FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    mini: true,
                    elevation: 0.0,
                    child: Icon(Icons.add, color: Colors.black, size: 17.0)),
              ],
            ),
          ),
          Image.asset('assets/images/Forest-pana.png'),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  labelText: ('Search Lecture'),
                ),
              )),
        ],
      ),
    );
  }
}
