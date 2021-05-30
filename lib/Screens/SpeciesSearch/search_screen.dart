import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../species_information.dart';

class SpeciesSearchScreen extends StatelessWidget {
  const SpeciesSearchScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context, null),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    prefixIcon: Icon(Icons.style),
                    suffixIcon: Icon(Icons.search)),
                onSubmitted: (searchTerm) =>
                    context.read<SpeciesList>().searchForSpecie(searchTerm)),
          ),
          SpeciesListViewBuilder()
        ],
      ),
    );
  }
}

class SpeciesListViewBuilder extends StatelessWidget {
  const SpeciesListViewBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: context
            .watch<SpeciesList>()
            .getFutureSpecies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            );
          } else if (snapshot.hasData) {
            List<Specie> speciesList = snapshot.data;
            return ListView.builder(
              itemCount: speciesList.length,
              itemBuilder: (context, index) {
                var favorites = Provider.of<FavoriteSpecies>(context, listen: true);
                return ListTile(
                  title: Text(speciesList[index].swedishName),
                  subtitle: Text(speciesList[index].scientificName),
                  trailing: IconButton(
                      onPressed: () async {
                        // final futureSpeciesDetail = await context
                        //     .read<SpeciesList>()
                        //     .getSpeciesDetail(speciesList[index].taxonId);
                        favorites.favorSpecie(speciesList[index]);
                      },
                      icon: favorites.getFavoriteSpecies.contains(speciesList[index])
                          ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      )

                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/search/details',
                        arguments: speciesList[index]);
                  },
                );
              },
            );
          } else {
            return ListTile(
              title: Text('Here you search'),
            );
          }
        },
      ),
    );
  }
}
