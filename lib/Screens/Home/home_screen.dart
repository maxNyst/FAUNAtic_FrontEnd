import 'package:faunatic_front_end/species_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            child: Text(
              'Sign out',
            ),
          ),
        ],
        title: Text('Logged In! Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.style),
                  suffixIcon: Icon(Icons.search)),
              onSubmitted: (string) =>
                  context.read<SpeciesList>().searchForSpecie(string),
            ),
          ),
          FutureBuilder(
            future: context.watch<SpeciesList>().getFutureSpecies,
            builder: (context, snapshot) {
              print(snapshot.toString());
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                );
              } else if (snapshot.hasData) {
                List<Specie> s = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: s.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(s[index].swedishName),
                        subtitle: Text(s[index].scientificName),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: ListTile(
                    title: Text('Here you search'),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
