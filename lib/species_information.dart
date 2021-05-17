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
    final species = <Specie>[];

    // notifyListeners();

    final response = await http.get(
        Uri.https('group7-15.pvt.dsv.su.se', '/search', {'term': searchTerm}));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      for (var s in jsonData) {
        var specie = Specie.fromJson(s);
        species.add(specie);
      }
    }
    return species;
  }

  Future<SpeciesDetail> getSpeciesDetail(int taxonId) async {
    SpeciesDetail speciesDetail;
    final response = await http.get(Uri.https(
        'group7-15.pvt.dsv.su.se', '/texts', {'id': taxonId.toString()}));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      print(jsonData);

      speciesDetail = SpeciesDetail.fromJson(jsonData);
    }
    print(speciesDetail);

    return speciesDetail;
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

// To parse this JSON data, do
//
//     final speciesDetail = speciesDetailFromJson(jsonString);

class SpeciesDetail {
  String swedishName;
  String scientificName;
  SpeciesData speciesData;
  String imageURL;

  SpeciesDetail(
      {this.swedishName, this.scientificName, this.speciesData, this.imageURL});

  SpeciesDetail.fromJson(Map<String, dynamic> json) {
    swedishName = json['swedishName'];
    scientificName = json['scientificName'];
    speciesData = json['speciesData'] != null
        ? SpeciesData.fromJson(json['speciesData'])
        : null;
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['swedishName'] = swedishName;
    data['scientificName'] = scientificName;
    if (speciesData != null) {
      data['speciesData'] = speciesData.toJson();
    }
    data['imageURL'] = imageURL;
    return data;
  }
}

class SpeciesData {
  String characteristicAsHtml;
  String ecologyAsHtml;
  String other;
  String conservationMeasuresAsHtml;
  String characteristicChangedDate;
  String characteristic;
  String spreadAndStatusAsHtml;
  String conservationMeasures;
  String otherAsHtml;
  String ecology;
  String conservationMeasuresChangedDate;
  String spreadAndStatus;
  String threatAsHtml;
  String spreadAndStatusChangedDate;
  String ecologyChangedDate;
  String threatChangedDate;
  String threat;
  String otherChangedDate;

  SpeciesData(
      {this.characteristicAsHtml,
      this.ecologyAsHtml,
      this.other,
      this.conservationMeasuresAsHtml,
      this.characteristicChangedDate,
      this.characteristic,
      this.spreadAndStatusAsHtml,
      this.conservationMeasures,
      this.otherAsHtml,
      this.ecology,
      this.conservationMeasuresChangedDate,
      this.spreadAndStatus,
      this.threatAsHtml,
      this.spreadAndStatusChangedDate,
      this.ecologyChangedDate,
      this.threatChangedDate,
      this.threat,
      this.otherChangedDate});

  SpeciesData.fromJson(Map<String, dynamic> json) {
    characteristicAsHtml = json['characteristicAsHtml'];
    ecologyAsHtml = json['ecologyAsHtml'];
    other = json['other'];
    conservationMeasuresAsHtml = json['conservationMeasuresAsHtml'];
    characteristicChangedDate = json['characteristicChangedDate'];
    characteristic = json['characteristic'];
    spreadAndStatusAsHtml = json['spreadAndStatusAsHtml'];
    conservationMeasures = json['conservationMeasures'];
    otherAsHtml = json['otherAsHtml'];
    ecology = json['ecology'];
    conservationMeasuresChangedDate = json['conservationMeasuresChangedDate'];
    spreadAndStatus = json['spreadAndStatus'];
    threatAsHtml = json['threatAsHtml'];
    spreadAndStatusChangedDate = json['spreadAndStatusChangedDate'];
    ecologyChangedDate = json['ecologyChangedDate'];
    threatChangedDate = json['threatChangedDate'];
    threat = json['threat'];
    otherChangedDate = json['otherChangedDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['characteristicAsHtml'] = characteristicAsHtml;
    data['ecologyAsHtml'] = ecologyAsHtml;
    data['other'] = other;
    data['conservationMeasuresAsHtml'] = conservationMeasuresAsHtml;
    data['characteristicChangedDate'] = characteristicChangedDate;
    data['characteristic'] = characteristic;
    data['spreadAndStatusAsHtml'] = spreadAndStatusAsHtml;
    data['conservationMeasures'] = conservationMeasures;
    data['otherAsHtml'] = otherAsHtml;
    data['ecology'] = ecology;
    data['conservationMeasuresChangedDate'] = conservationMeasuresChangedDate;
    data['spreadAndStatus'] = spreadAndStatus;
    data['threatAsHtml'] = threatAsHtml;
    data['spreadAndStatusChangedDate'] = spreadAndStatusChangedDate;
    data['ecologyChangedDate'] = ecologyChangedDate;
    data['threatChangedDate'] = threatChangedDate;
    data['threat'] = threat;
    data['otherChangedDate'] = otherChangedDate;
    return data;
  }
}
