import 'package:faunatic_front_end/species_information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../string_extension.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = Provider.of<List<SpeciesDetail>>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/Forest-bro.png'),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text('Favorites',
                      style: TextStyle(color: Colors.black, fontSize: 45)))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                print(favorites);
              return Card(
                child: ListTile(
                  trailing: Icon(Icons.yard, color: Colors.black87,),
                  title: Text(
                    favorites[index].swedishName.capitalize(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(),
                  ),
                  subtitle: Text(favorites[index].scientificName),
                  leading: SizedBox(
                    width: 60,
                    child: favorites[index].imageURL.isEmpty
                        ? Image.asset('assets/images/logo.png')
                        : Image(
                      image: NetworkImage(favorites[index].imageURL),
                    ),
                  ),
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}
