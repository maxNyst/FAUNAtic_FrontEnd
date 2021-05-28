import 'package:faunatic_front_end/Screens/Lecture/Components/location.dart';

class Geometry {
  final Location location;

  Geometry({this.location});

  factory Geometry.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Geometry(
      location: Location.fromJson(parsedJson['location'])
    );
  }
}