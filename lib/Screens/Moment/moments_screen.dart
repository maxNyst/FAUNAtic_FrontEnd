import 'package:faunatic_front_end/Screens/Moment/moment_map_screen.dart';
import 'package:faunatic_front_end/excursion_model.dart';
import 'package:faunatic_front_end/species_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import '../../string_extension.dart';
import '../../note_model.dart';
import 'custom_note.dart';


class MomentsScreen extends StatefulWidget {
  MomentsScreen({Key key}) : super(key: key);

  @override
  _MomentsScreenState createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  var _visibleFAB = true;
  int markerCounter = 0;
  var list;
  MaterialPageRoute mpr;

  @override
  Widget build(BuildContext context) {
    list = context.read<List>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    color: Colors.black12,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    alignment: Alignment.center,
                    child: Text(
                      'Utflyktsplanering',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                } else {
                  var noteOrSpecieOrCoordinate = list[index - 1];

                  if (noteOrSpecieOrCoordinate is NoteModel) {
                    final note = noteOrSpecieOrCoordinate;
                    return Card(
                      child: Column(
                        children: [
                          ListTile(title: Text(note.title), trailing: Icon(Icons.subtitles, color: Colors.black87),),
                          ListTile(title: Text(note.body)),
                        ],
                      ),
                    );
                  } else if (noteOrSpecieOrCoordinate is SpeciesDetail) {
                    final specie = noteOrSpecieOrCoordinate;
                    return Card(
                      child: ListTile(
                        trailing: Icon(Icons.yard, color: Colors.black87,),
                        title: Text(
                          specie.swedishName.capitalize(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(),
                        ),
                        subtitle: Text(specie.scientificName),
                        leading: SizedBox(
                          width: 60,
                          child: specie.imageURL.isEmpty
                              ? Image.asset('assets/images/logo.png')
                              : Image(
                                  image: NetworkImage(specie.imageURL),
                                ),
                        ),
                      ),
                    );
                  } else if (noteOrSpecieOrCoordinate is GoogleMaps) {
                    final coordinate = noteOrSpecieOrCoordinate;
                    return Card(
                      child: ListTile(
                        trailing: Icon(Icons.location_on, color: Colors.black87),
                        title: Text(
                          coordinate.place.capitalize(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(),
                        ),
                        subtitle: Text(coordinate.name.capitalize()),

                      ),
                    );
                  }
                  return SizedBox.shrink();
                }
              },
            ),
          ),
          // Container(height: 44, color: Colors.purple)
        ],
      ),
      floatingActionButton: _buildSpeedDial(_visibleFAB),
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
                  onTap: () => {
                    print('placera på kartan'),
                    markerCounter++,
                    Navigator.push(
                      context,
                      mpr = MaterialPageRoute(
                        builder: (context) {
                          return MomentMapScreen(markerCounter: markerCounter);
                        },
                      ),
                    ),
                    mpr.popped.then((value) => state()),
                  },
                ),
                ListTile(
                  title: Text('Placera på nuvarande plats'),
                  onTap: () => {
                    markerCounter++,
                  },
                ),
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
                  title: Text('Sök i artdatabanken'),
                  onTap: _searchSpeciesInformation,
                ),
                ListTile(
                  title: Text('Bläddra bland sparade arter'),
                  onTap: () => Navigator.pushNamed(context, '/favorites'),
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
              onTap: _getCustomNote,
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

  void _getCustomNote() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomNote(),
        ));
    if (result != null) {
      setState(() {
        list.add(result);
      });
    }
  }

  // Show a modalbottomsheet and hides the speedDial while open.
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

  void _searchSpeciesInformation() async {
    final result = await Navigator.pushNamed(context, '/search');
    if (result != null) {
      setState(() {
        list.add(result);
      });
      Navigator.pop(context);
    }
  }

  void state() {
    setState(() {

    });
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
