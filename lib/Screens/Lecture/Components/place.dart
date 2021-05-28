import 'package:faunatic_front_end/Screens/Lecture/Components/geometry.dart';

class Place {
  final Geometry geometry;
  final String name;

  Place({this.geometry, this.name});

  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      name: parsedJson['formatted_address'],
    );
  }

}