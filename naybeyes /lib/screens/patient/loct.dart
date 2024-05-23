import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Finder',
      home: LocationFinderPage(),
    );
  }
}

class LocationFinderPage extends StatefulWidget {
  @override
  _LocationFinderPageState createState() => _LocationFinderPageState();
}

class _LocationFinderPageState extends State<LocationFinderPage> {
  String _locationMessage = '';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // Get the current location
  void _getLocation() async {
    late GoogleMapController mapController;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _locationMessage =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
    final LatLng _center = const LatLng(-33.86, 151.20);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Location Finder'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your current location is:',
              ),
              Text(
                _locationMessage,
                style: TextStyle(fontSize: 20),
              ),
              GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ))
            ],
          ),
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
