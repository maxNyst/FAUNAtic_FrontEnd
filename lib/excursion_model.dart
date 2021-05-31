import 'package:flutter/cupertino.dart';

class Excursion {
  final String userId;
  final String name;
  final GoogleMaps location;
  final List momentsList;

  Excursion({@required this.userId,
    @required this.name,
    @required this.location,
    @required this.momentsList});

  factory Excursion.fromJson(Map<String, dynamic> json) {
    return Excursion(
        userId: json['userId'] ?? 'ingen information om användaren',
        name: json['name'] ?? 'inget namn angett',
        location: json['location'],
        momentsList: json['momentsList']);
  }

  Map<String, Object> toJson() {
    return {
      'userId': userId,
      'name': name,
      'location': location.toJson(),
      'momentsList': momentsList
    };
  }
}

class GoogleMaps {
  final String place;
  final double lat;
  final double lng;
  final String address;
  final String name;
  final String description;

  GoogleMaps({@required this.place,
    @required this.lat,
    @required this.lng,
    @required this.address,
    @required this.name,
    @required this.description});

  factory GoogleMaps.fromJson(Map<String, dynamic> json) {
    return GoogleMaps(
        place: json['place'],
        lat: double.parse(json['lat']),
        lng: double.parse(json['lng']),
        address: json['address'],
        name: json['name'],
        description: json['description']);
  }

  Map<String, Object> toJson() {
    return {
      'place': place,
      'lat': lat,
      'lng': lng,
      'address': address,
      'name': name,
      'description': description
    };
  }
}
