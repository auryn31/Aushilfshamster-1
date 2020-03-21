import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  static const MARKERID = "PositionMarkerID";

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(47.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    _trackUser();
    return CupertinoPageScaffold(
      child: new Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            setState(() {
              _markers = {
                Marker(
                  markerId: MarkerId(MARKERID),
                  position: LatLng(47.42796133580664, -122.085749655962),
                )
              };
            });
          },
          markers: _markers,
        ),
      ),
    );
  }

  Future<void> _trackUser() async {
    Location location = new Location();

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
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }

    location.onLocationChanged().listen((location) {
      _goCurrentPosition(location.longitude, location.latitude);
    });
  }

  Future<void> _goCurrentPosition(double long, double lat) async {
    final GoogleMapController controller = await _controller.future;
    var marker = Marker(
      markerId: MarkerId(MARKERID),
      position: LatLng(lat, long),
    );

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 16.4746,
        ),
      ),
    );

    setState(() {
      print(_markers);
      _markers.removeWhere((m) => m.markerId.value == MARKERID);
      print(_markers);
      _markers.add(marker);
      print(_markers);
    });
  }
}
