
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
    if (!mapUpdated) {
      getLocation();
    }
    //var selectedId = selectedMarker;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Välj plats'),
      ),
      body: googleMap = GoogleMap(
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
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
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
      infoWindow: InfoWindow(title: markerIdVal == 'marker' ? '-' : first.thoroughfare, snippet: first.addressLine),
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
