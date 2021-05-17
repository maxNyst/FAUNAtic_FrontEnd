import 'package:faunatic_front_end/Screens/Species%20Detail/species_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../species_information.dart';

class SpeciesSearch extends StatelessWidget {
  const SpeciesSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
                decoration: InputDecoration(
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
        future: context.watch<SpeciesList>().getFutureSpecies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            );
          } else if (snapshot.hasData) {
            List<Specie> s = snapshot.data;
            return ListView.builder(
              itemCount: s.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(s[index].swedishName),
                  subtitle: Text(s[index].scientificName),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SpeciesDetails(specie: s[index]);
                        },
                      ),
                    );
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
