import 'package:faunatic_front_end/Screens/Lecture/Components/place_search.dart';
import 'package:faunatic_front_end/Screens/Lecture/Components/places_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location location = Location();
  LocationData _locationData;
  final placesService = PlacesService();
  List<PlaceSearch> searchResults = [];

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  //int _markerIdCounter = 1;
  GoogleMap googleMap;
  bool mapUpdated = false;

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
        title: Text('Välj plats'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Sök plats', suffixIcon: Icon(Icons.search)),
                  onChanged: (value) => searchPlaces(value),
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
                          );
                        },
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
            TextButton(
              style: addEnabled ? ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black12))
                  : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: _add,
              child: const Text('add'),
            ),
            TextButton(
              onPressed: selectedId == null ? null : () => _remove(selectedId),
              child: const Text('remove'),
            ),
          ],
        ),
      ),*/
    );
  }

  void searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm, ('' + _locationData.latitude.toString() + ',' + _locationData.longitude.toString()));
    setState(() {

    });
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

  /*void _add() {
    setState(() {
      addEnabled = !addEnabled;
      mapUpdated = true;
    });
  }*/

  void _addMarker(LatLng latLng) async {
    mapUpdated = true;
    if (latLng == null) {
      return;
    }

    var coordinates = Coordinates(latLng.latitude, latLng.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    var markerIdVal;
    if (first.thoroughfare == null) {
      markerIdVal = 'marker';
    } else {
      markerIdVal = first.thoroughfare;
    }
    //_markerIdCounter++;
    var markerId = MarkerId(markerIdVal);
    print(first.addressLine);

    var marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(
          title: markerIdVal == 'marker' ? '-' : first.thoroughfare,
          snippet: first.addressLine),
      onTap: () {
        _onMarkerTapped(markerId);
      },
      draggable: true,
    );

    setState(() {
      markers.clear();
      markers[markerId] = marker;
    });
    print(markerId.toString());
    await mapController.animateCamera(CameraUpdate.newLatLng(latLng));
    await Future.delayed(Duration(seconds: 1));
    await mapController.showMarkerInfoWindow(markerId);
  }

  /*void _remove(MarkerId markerId) {
    setState(() {
      if (markers.containsKey(markerId)) {
        markers.remove(markerId);
      }
    });
  }*/

}
