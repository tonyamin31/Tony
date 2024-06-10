import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naybeyes/screens/patient/location/location_helper.dart';

class FinderPage extends StatefulWidget {
  const FinderPage({super.key});

  @override
  State<FinderPage> createState() => MapSampleState();
}

class MapSampleState extends State<FinderPage> {
  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _mycurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.determinePosition();

    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: _mycurrentLocationCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_mycurrentLocationCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finder'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                )
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _goToMyCurrentLocation,
          child: const Icon(
            Icons.place_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
