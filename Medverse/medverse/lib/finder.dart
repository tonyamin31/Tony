import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(finder());

class finder extends StatelessWidget {
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
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _locationMessage =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
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
          ],
        ),
      ),
    );
  }
}
