import 'package:faunatic_front_end/Screens/Lecture/Components/place_search.dart';
import 'package:faunatic_front_end/Screens/Lecture/map_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyDb5XBBC0zY4TtEN_xiNnHPHUMk9-tUQbw';

  Future<List<PlaceSearch>> getAutocomplete(String search, String coordinates) async {
    var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key&location=$coordinates)';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}