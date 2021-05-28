import 'package:faunatic_front_end/Screens/Lecture/Components/place.dart';
import 'package:faunatic_front_end/Screens/Lecture/Components/place_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyDb5XBBC0zY4TtEN_xiNnHPHUMk9-tUQbw';

  Future<List<PlaceSearch>> getAutocomplete(
      String search, String coordinates) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key&location=$coordinates';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?key=$key&place_id=$placeId&language=se';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<Place> getPlaceFromCoor(String latLng) async {
    var url =
        'https://maps.googleapis.com/maps/api/geocode/json?key=$key&latlng=$latLng&language=se';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['results'] as List<dynamic>;
    var jsonResultMap = jsonResult[0] as Map<String, dynamic>;
    return Place.fromJson(jsonResultMap);
  }

}
