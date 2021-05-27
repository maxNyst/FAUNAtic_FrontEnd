import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'custom_note.dart';

class MomentsScreen extends StatefulWidget {
  MomentsScreen({Key key}) : super(key: key);

  @override
  _MomentsScreenState createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  var _visibleFAB = true;
  final list = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Hem'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    color: Colors.blue,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text('Detta är listan !'),
                  );
                } else {
                  var s = list[index - 1];
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.orangeAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.title),
                        SizedBox(
                          height: 10,
                        ),
                        Text(s.body),
                        Divider(
                          height: 2,
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _buildSpeedDial(_visibleFAB),
      bottomNavigationBar: BottomAppBar(
        child: Row(
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
              onTap: () =>
                  _modalBottomSheet('Lägg till kartmarkör', Icons.location_on, [
                ListTile(
                  title: Text('Placera på karta'),
                ),
                ListTile(
                  title: Text('Placera på nuvarande plats'),
                )
              ]),
              label: 'Plats',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            ),
            SpeedDialChild(
              child: Icon(Icons.yard, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () =>
                  _modalBottomSheet('Lägg till art', Icons.yard_outlined, [
                ListTile(
                  title: Text('Sök i artfakta'),
                ),
                ListTile(
                  title: Text('Bläddra bland sparade arter'),
                )
              ]),
              label: 'Art',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              labelBackgroundColor: Colors.black,
            ),
            SpeedDialChild(
              child: Icon(Icons.subtitles, color: Colors.white),
              backgroundColor: Colors.green,
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomNote(),
                    ));
                setState(() {
                  list.add(result);
                });
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

  void _modalBottomSheet(String title, IconData icon, List listTiles) {
    setState(() {
      _visibleFAB = false;
    });
    var modalResponse = showModalBottomSheet(
      context: context,
      builder: (context) => _CustomBottomSheet(
        title: title,
        icon: icon,
        listTiles: listTiles,
      ),
    );
    modalResponse.whenComplete(() => setState(() {
          _visibleFAB = true;
        }));
  }
}

class _CustomBottomSheet extends StatelessWidget {
  final String title;
  final IconData icon;
  final List listTiles;

  const _CustomBottomSheet({
    Key key,
    @required this.title,
    @required this.icon,
    this.listTiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          icon,
          size: 29,
          color: Colors.black,
        ),
      ),
      Divider(),
      ...listTiles
    ]);
  }
}
