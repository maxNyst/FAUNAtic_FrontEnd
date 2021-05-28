import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleClassroomScreen extends StatelessWidget {
  const GoogleClassroomScreen({
    Key key,
  }) : super(key: key);

  // ignore: always_declare_return_types
  openURL() async {
    if (await canLaunch('https://classroom.google.com')) {
      await launch('https://classroom.google.com');
    } else {
      throw 'Could Not Launch URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        iconTheme: IconThemeData(color: Colors.green),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.green,
              size: 27,
            ),
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 150,
            width: 100,
            child: Image.asset(
              'assets/images/logo.png',
              color: Colors.green,
              height: 20,
              width: 15,
              scale: 0.1,
              filterQuality: FilterQuality.high,
            ),
          ),
          Text(
            'FAUNAtic',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            '+',
            style: TextStyle(fontSize: 50, color: Colors.green),
          ),
          SizedBox(
            height: 150,
            width: 300,
            child: Image.asset(
              'assets/images/googleclassroom_logo.png',
              height: 300,
              width: 200,
              scale: 0.1,
              filterQuality: FilterQuality.high,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  color: Colors.white60,
                  onPressed: () {
                    openURL();
                    print('pressed button');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    'Öppna Google Classroom',
                    style: TextStyle(color: Colors.green),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
