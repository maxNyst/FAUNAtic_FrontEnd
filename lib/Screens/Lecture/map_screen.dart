import 'dart:async';

import 'package:faunatic_front_end/Screens/Lecture/Components/place.dart';
import 'package:faunatic_front_end/Screens/Lecture/Components/place_search.dart';
import 'package:faunatic_front_end/Screens/Lecture/Components/places_service.dart';
import 'package:faunatic_front_end/Screens/Lecture/lecture_screen.dart';
import 'package:faunatic_front_end/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) :
        super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();

}

class _MapScreenState extends State<MapScreen> {

  Location location = Location();
  LocationData _locationData;
  final placesService = PlacesService();
  List<PlaceSearch> searchResults = [];
  Place selectedLocation;
  String placeTitle;

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  GoogleMap googleMap;
  bool mapUpdated = false;
  TextField searchField;
  final fieldText = TextEditingController();

  static const LatLng STOCKHOLM_COORDINATES = LatLng(59.334591, 18.063240);
  LatLng center = STOCKHOLM_COORDINATES;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LocationData getLocationData() {
    return _locationData;
  }

  void getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    center = LatLng(_locationData.latitude, _locationData.longitude);
    await mapController.moveCamera(CameraUpdate.newLatLng(center));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (!mapUpdated) {
      getLocation();
    }
    //var selectedId = selectedMarker;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Välj område'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: searchField = TextField(
                  decoration: InputDecoration(
                      hintText: 'Sök', suffixIcon: Icon(Icons.search)),
                  onChanged: (value) => searchPlaces(value),
                  controller: fieldText,
                  focusNode: FocusNode(
                      skipTraversal: false,
                      canRequestFocus: true,
                      descendantsAreFocusable: true),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: size.height - 150,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      onTap: (LatLng latLng) {
                        _addMarker(latLng);
                      },
                      initialCameraPosition: CameraPosition(
                        target: center,
                        zoom: 11.0,
                      ),
                      markers: Set<Marker>.of(markers.values),
                    ),
                  ),
                  if (searchResults != null && searchResults.isNotEmpty)
                    Container(
                      height: size.height - 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black87.withOpacity(.6),
                          backgroundBlendMode: BlendMode.darken),
                    ),
                  if (searchResults != null && searchResults.isNotEmpty)
                    Container(
                      height: size.height - 150,
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              searchResults[index].description,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              setSelectedLocation(searchResults[index].placeId);
                            },
                          );
                        },
                      ),
                    ),
                  if (selectedLocation != null)
                    Center(
                      heightFactor: size.height - (size.height * 0.9715),
                      child: SizedBox(
                        height: 50.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Provider.of<FirestoreService>(context, listen: false).userRef.set({
                              'place': '$placeTitle',
                              'address': '${selectedLocation.name}',
                              'lat': '${selectedLocation.geometry.location.lat}',
                              'lng': '${selectedLocation.geometry.location.lng}'
                            });
                            Navigator.pop(context, [placeTitle]);
                          },
                          child: Text(
                            'Lägg till',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      /*bottomNavigationBar: BottomAppBar(
        //color: Colors.green,
        child: Row(
          children: <Widget>[
            Text(placeTitle),
            ElevatedButton(
                onPressed: (){},
                child: Text('Lägg till')
            ),
          ],
        ),
      ),*/
    );
  }

  void searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(
        searchTerm,
        ('' +
            _locationData.latitude.toString() +
            ',' +
            _locationData.longitude.toString()));
    setState(() {});
  }

  void _onMarkerTapped(MarkerId markerId) {
    var tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        var previousMarkerId = selectedMarker;
        if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
          var resetOld = markers[previousMarkerId]
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        var newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;
      });
    }
  }

  void _addMarker(LatLng latLng) async {
    var newLatLng =
        ('' + latLng.latitude.toString() + ',' + latLng.longitude.toString());
    selectedLocation = await placesService.getPlaceFromCoor(newLatLng);
    var markerId = newMarker(selectedLocation);

    await mapController.animateCamera(CameraUpdate.newLatLng(latLng));
    await Future.delayed(Duration(seconds: 1));
    await mapController.showMarkerInfoWindow(markerId);
  }

  MarkerId newMarker(Place place) {
    mapUpdated = true;
    /*if (place == null) {
      return;
    }*/

    if (place.name == null || place.name.isEmpty || place == null) {
      placeTitle = 'marker';
    } else {
      placeTitle = place.name.substring(0, place.name.indexOf(','));
    }
    //placeTitle ??= 'marker';
    var markerId = MarkerId(placeTitle);

    var latLng =
        LatLng(place.geometry.location.lat, place.geometry.location.lng);

    var marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(
          title: placeTitle == 'marker' ? '-' : placeTitle,
          snippet: place.name),
      onTap: () {
        _onMarkerTapped(markerId);
      },
      draggable: true,
    );

    setState(() {
      markers.clear();
      markers[markerId] = marker;
    });
    return markerId;
  }

  Future<void> _goToPlace(Place place) async {
    /*await mapController.animateCamera(
        CameraUpdate.newLatLng(
            LatLng(place.geometry.location.lat, place.geometry.location.lng)
        )
    );*/
    await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0)));
  }

  void setSelectedLocation(String placeId) async {
    selectedLocation = await placesService.getPlace(placeId);
    searchResults = null;
    setState(() {
      fieldText.clear();
      //var curr = FocusScope.of(context);
      //curr.focusedChild.unfocus();
      //searchField.focusNode.unfocus();
      //FocusManager.instance.primaryFocus.unfocus();
      //WidgetsBinding.instance.focusManager.primaryFocus.unfocus();
    });
    await Future.delayed(Duration(milliseconds: 500));
    if (selectedLocation == null) {
      return;
    }
    await _goToPlace(selectedLocation);
    await Future.delayed(Duration(seconds: 1));
    createMarker(selectedLocation);
  }

  void createMarker(Place place) async {
    var markerId = newMarker(place);

    await Future.delayed(Duration(seconds: 1));
    await mapController.showMarkerInfoWindow(markerId);
    setState(() {
      searchField.focusNode.unfocus();
    });
  }
}

/*Navigator.push(
context,
MaterialPageRoute(
builder: (context) {
return MapScreen();
},
),
);*/
