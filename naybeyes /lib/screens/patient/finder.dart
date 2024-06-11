import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:naybeyes/screens/patient/location/location_helper.dart';

class FinderPage extends StatefulWidget {
  const FinderPage({super.key});

  @override
  State<FinderPage> createState() => MapSampleState();
}

class MapSampleState extends State<FinderPage> {
  static const CameraPosition _hospital = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(29.99744678760729, 30.96603025258612),
      tilt: 59.440717697143555,
      zoom: 20);

  FloatingSearchBarController controller = FloatingSearchBarController();

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

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          ),
        );
      },
      controller: controller,
      elevation: 6,
      hintStyle: TextStyle(
        fontSize: 18,
      ),
      queryStyle: TextStyle(fontSize: 18),
      hint: "  Find a place..",
      border: BorderSide(style: BorderStyle.none),
      margins: EdgeInsets.fromLTRB(20, 30, 20, 0),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 52,
      iconColor: Colors.blue,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 400),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 100),
      onQueryChanged: (query) {},
      onFocusChanged: (_) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(
                Icons.place,
                color: Colors.black.withOpacity(0.6),
              ),
              onPressed: () {}),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                ),
          buildFloatingSearchBar(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 0, 16),
              child: FloatingActionButton(
                backgroundColor: Color(0xFF199A8E),
                onPressed: _goToMyCurrentLocation,
                child: const Icon(
                  Icons.place_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 16, 16),
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFF199A8E),
                onPressed: _goToHospital, // Add your onPressed code here
                icon: const Icon(
                  Icons.local_hospital_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Nearest Hospital',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToHospital() async {
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_hospital));
  }
}
