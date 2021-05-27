import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MomentsScreen extends StatefulWidget {
  MomentsScreen({Key key}) : super(key: key);

  @override
  _MomentsScreenState createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  var _visibleFAB = true;
  var list = [];
  final TextEditingController eCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Hem'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.orangeAccent,
                    width: size.width,
                    height: 20,
                    child: Text(list[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _buildSpeedDial(_visibleFAB),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  Builder _buildSpeedDial(bool visible) {
    return Builder(
      builder: (BuildContext context) {
        return SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: IconThemeData(size: 28.0, color: Colors.white),
          backgroundColor: Theme.of(context).accentColor,
          visible: visible,
          curve: Curves.bounceInOut,
          children: [
            SpeedDialChild(
              child: Icon(Icons.location_on, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () => print('Pressed Read Later'),
              label: 'Plats',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            ),
            SpeedDialChild(
              child: Icon(Icons.yard, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () => print('Pressed Write'),
              label: 'Art',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            ),
            SpeedDialChild(
              child: Icon(Icons.subtitles, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () {
                setState(() {
                  _visibleFAB = false;
                });
                var modalResponse = showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 200,
                    child: TextField(
                      controller: eCtrl,
                      onSubmitted: (text) {
                        eCtrl.clear();
                        setState(() {
                          list.add(text);
                        });
                        print(list.toString());
                      },
                    ),
                  ),
                );
                modalResponse.whenComplete(() => setState(() {
                      _visibleFAB = true;
                    }));
              },
              label: 'Notering',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            ),
          ],
        );
      },
    );
  }
}
