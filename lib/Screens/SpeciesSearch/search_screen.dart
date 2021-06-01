import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../species_information.dart';
import '../../string_extension.dart';

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
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          hintText: "Sök efter arter",
                          border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                      onSubmitted: (searchTerm) => context
                          .read<SpeciesList>()
                          .searchForSpecie(searchTerm)),
                ),
              ],
            ),
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
        future: context.watch<SpeciesList>().getFutureSpecies,
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
                return Card(
                  child: ListTile(
                    title: Text(speciesList[index].swedishName.capitalize()),
                    subtitle: Text(speciesList[index].scientificName),
                    trailing: IconButton(
                      onPressed: () async {
                        final futureSpeciesDetail = await context
                            .read<SpeciesList>()
                            .getSpeciesDetail(speciesList[index].taxonId);
                        Navigator.pop(context, futureSpeciesDetail);
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/search/details',
                          arguments: speciesList[index]);
                    },
                  ),
                );
              },
            );
          } else {
            return ListTile(
              title: Text('Dina sökresultat'),
            );
          }
        },
      ),
    );
  }
}
