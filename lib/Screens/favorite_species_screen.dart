import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:faunatic_front_end/species_information.dart';

class FavoriteSpeciesScreen extends StatelessWidget {
  const FavoriteSpeciesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<FavoriteSpecies>().getFavoriteSpecies;
    assert(favorites != null);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mina Favoriter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.favorite,
                    color: Colors.green,
                    size: 40,
                  )
                ],
              )),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              children: [
                ..._buildGridBuilder(favorites),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<dynamic> _buildGridBuilder(List<Specie> favorites) {
    if (favorites.isEmpty) {
      return [];
    } else {
      var widgets = [];
      for (var specie in favorites) {
        widgets.add(Container(
          child: Text(specie.swedishName),
        ));
      }
      return widgets;
    }
  }
}
