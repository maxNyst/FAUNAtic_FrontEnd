import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpeciesList extends ChangeNotifier {
  // Another solution if this one gives us trouble:
  // StreamController https://ericwindmill.com/articles/async_dart_flutter/
  Future<List<Specie>> _futureSpecies;

  Future<List<Specie>> get getFutureSpecies => _futureSpecies;

  void searchForSpecie(String searchTerm) {
    _futureSpecies = _speciesSearchResult(searchTerm);
    notifyListeners();
  }

  Future<List<Specie>> _speciesSearchResult(String searchTerm) async {
    final List<Specie> species = [];
    // notifyListeners();

    final response = await http.get(
        Uri.https('group7-15.pvt.dsv.su.se', '/search', {'term': searchTerm}));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      for (var s in jsonData) {
        Specie specie = Specie.fromJson(s);
        species.add(specie);
      }
    }
    return species;
  }
}

class Specie {
  final int taxonId;
  final String swedishName;
  final String scientificName;

  Specie(
      {@required this.taxonId,
      @required this.swedishName,
      @required this.scientificName});

  factory Specie.fromJson(Map<String, dynamic> json) {
    return Specie(
      taxonId: json['taxonId'],
      swedishName: json['swedishName'],
      scientificName: json['scientificName'],
    );
  }

  @override
  String toString() {
    return '$swedishName - på latin: $scientificName';
  }
}
