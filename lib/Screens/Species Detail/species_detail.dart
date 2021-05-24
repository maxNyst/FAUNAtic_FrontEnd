import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../species_information.dart';

class SpeciesDetailsScreen extends StatelessWidget {
  final Specie specie;

  SpeciesDetailsScreen({Key key, @required this.specie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(specie.swedishName),
      ),
      body: FutureBuilder(
        future: context.read<SpeciesList>().getSpeciesDetail(specie.taxonId),
        builder: (context, snapshot) {
          print(snapshot.connectionState);

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final speciesDetail = snapshot.data;
            return Center(
              child: Image(
                image: NetworkImage(speciesDetail.imageURL),
              ),
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
  }
}
