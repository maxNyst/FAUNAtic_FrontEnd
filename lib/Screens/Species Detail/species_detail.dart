import 'package:faunatic_front_end/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../string_extension.dart';
import '../../species_information.dart';

class SpeciesDetailsScreen extends StatelessWidget {
  final Specie specie;
  final SpeciesDetail speciesDetail;

  SpeciesDetailsScreen(
      {Key key, @required this.specie, @required this.speciesDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<List<SpeciesDetail>>(context);
    void _test() {
      print('detta är ett test');
      print(favorites);
      print(speciesDetail);
      assert(favorites != null);
    }

    _test();
    return Scaffold(
      appBar: AppBar(
        title: Text(specie.swedishName.capitalize()),
        actions: [
          if (favorites.contains(speciesDetail)) ...[
            IconButton(
                onPressed: () {
                  context.read<FirestoreService>().removeFavorite(speciesDetail);
                },
                icon: Icon(Icons.favorite, color: Colors.red))
          ] else ...[
            IconButton(
                onPressed: () {
                  context.read<FirestoreService>().addFavorite(speciesDetail);
                },
                icon: Icon(Icons.favorite_border, color: Colors.red))
          ]
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image(
                image: NetworkImage(speciesDetail.imageURL),
              ),
            ),
            Text(specie.scientificName,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300)),
            //Rubrik 1
            Row(
              children: <Widget>[
                Text('Beskrivning',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25.0,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child:
                      Icon(Icons.article, color: Theme.of(context).accentColor),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
            ),
            // Brödtext 1
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                speciesDetail.speciesData.characteristic ??
                    'Information ej tillgänglig',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
            //Rubrik 2
            Row(
              children: [
                Text('Ekologi',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25.0,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Icon(Icons.bug_report,
                      color: Theme.of(context).accentColor),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
            ),
            // Brödtext 2
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                  speciesDetail.speciesData.ecology ??
                      'Information ej tillgänglig',
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            ),
            //Rubrik 3
            Row(
              children: [
                Text('Utbredning',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25.0,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Icon(Icons.zoom_out_map,
                      color: Theme.of(context).accentColor),
                )
              ],
            ),
            Divider(
              thickness: 1.0,
            ),
            // Brödtext 3
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                  speciesDetail.speciesData.spreadAndStatus ??
                      'Information ej tillgänglig',
                  style: TextStyle(
                    fontSize: 17.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
