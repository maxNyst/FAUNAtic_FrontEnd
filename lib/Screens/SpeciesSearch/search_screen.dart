import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';
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
                          return Scaffold(
                            appBar: AppBar(
                              title: Text(s[index].swedishName),
                            ),
                            body: FutureBuilder(
                              future: context
                                  .read<SpeciesList>()
                                  .getSpeciesDetail(s[index].taxonId),
                              builder: (context, snapshot) {
                                print(snapshot.connectionState);

                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  final speciesDetail = snapshot.data;
                                  return DetailsScreen(
                                    speciesDetail: speciesDetail,
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text(snapshot.error.toString()),
                                  );
                                } else {
                                  return Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                }
                              },
                            ),
                          );
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

class DetailsScreen extends StatelessWidget {
  final SpeciesDetail speciesDetail;

  const DetailsScreen({Key key, this.speciesDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: NetworkImage(speciesDetail.imageURL),
      ),
    );
  }
}
