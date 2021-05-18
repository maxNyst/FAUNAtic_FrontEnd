
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
  Location location;
  LocationData _locationData;

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 1;
  GoogleMap googleMap;
  bool addEnabled = false;
  bool mapUpdated = false;

  static const LatLng STOCKHOLM_COORDINATES = LatLng(59.334591, 18.063240);
  LatLng center = STOCKHOLM_COORDINATES;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void getLocation() async {
    location = Location();
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
    if (!mapUpdated) {
      getLocation();
    }
    var selectedId = selectedMarker;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Map'),
      ),
      body: googleMap = GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: (LatLng latLng) {
          if (addEnabled) {
            _addMarker(latLng);
          } else {
            _addMarker(null);
          }
        },
        initialCameraPosition: CameraPosition(
          target: center,
          zoom: 11.0,
        ),
        markers: Set<Marker>.of(markers.values),
      ),
      bottomNavigationBar: BottomAppBar(
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
      ),
    );
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

  void _onMarkerDragEnd(MarkerId markerId, LatLng newPosition) async {
    var tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  )
                ],
                content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 66),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Old position: ${tappedMarker.position}'),
                        Text('New position: $newPosition'),
                      ],
                    )));
          });
    }
  }

  void _add() {
    setState(() {
      addEnabled = !addEnabled;
      mapUpdated = true;
    });
  }

  void _addMarker(LatLng latLng) async {
    if (latLng == null) {
      return;
    }

    var coordinates = Coordinates(latLng.latitude, latLng.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;

    var markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    var markerId = MarkerId(markerIdVal);

    var marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(title: first.thoroughfare, snippet: first.addressLine),
      onTap: () {
        _onMarkerTapped(markerId);
      },
      onDragEnd: (LatLng position) {
        _onMarkerDragEnd(markerId, position);
      },
      draggable: true,
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  void _remove(MarkerId markerId) {
    setState(() {
      if (markers.containsKey(markerId)) {
        markers.remove(markerId);
      }
    });
  }

}
