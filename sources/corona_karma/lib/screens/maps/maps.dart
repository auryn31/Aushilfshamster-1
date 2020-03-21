import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  static const MARKERID = "PositionMarkerID";
  static const INITIAL_LOCATION = LatLng(47.42796133580664, -122.085749655962);
  static const ZOOM_LEVEL = 16.4746;

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  LocationData currentLocation;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: INITIAL_LOCATION,
    zoom: ZOOM_LEVEL,
  );

  @override
  Widget build(BuildContext context) {
    _trackUser();
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {
                  _markers = {
                    Marker(
                      markerId: MarkerId(MARKERID),
                      position: currentLocation != null
                          ? LatLng(currentLocation.latitude,
                              currentLocation.longitude)
                          : INITIAL_LOCATION,
                    )
                  };
                });
              },
              markers: _markers,
              myLocationButtonEnabled: false,
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CupertinoTextField(
                      placeholder: "Suche", onChanged: (value) => print(value)),
                ),
                CupertinoButton(
                  child: Icon(CupertinoIcons.search),
                  onPressed: () {},
                )
              ],
            ),
            padding: EdgeInsets.all(16),
          ),
          new Positioned(
            child: new Align(
              alignment: FractionalOffset.bottomRight,
              child: CupertinoButton(
                child: Icon(CupertinoIcons.add),
                onPressed: () => _goToCurrentLocation(),
              ),
            ),
          ),
        ],
      )

          // floatingActionButton: CupertinoButton(
          //   onPressed: _goToCurrentLocation,
          //   child: Icon(CupertinoIcons.person),
          // ),
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
      _updateCurrentLocation(location);
    });
  }

  Future<void> _updateCurrentLocation(LocationData location) async {
    var marker = Marker(
      markerId: MarkerId(MARKERID),
      position: LatLng(location.latitude, location.longitude),
    );

    setState(() {
      currentLocation = location;
      _markers.removeWhere((m) => m.markerId.value == MARKERID);
      _markers.add(marker);
    });
  }

  Future<void> _goToCurrentLocation() async {
    if (currentLocation == null) {
      return;
    }
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: ZOOM_LEVEL,
        ),
      ),
    );
  }
}
