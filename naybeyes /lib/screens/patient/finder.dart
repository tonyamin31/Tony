import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FinderPage extends StatelessWidget {
  const FinderPage({super.key});
  

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
      body: const Center(
        child: Column(
          children: [
            // GoogleMap(
            //     onMapCreated: _onMapCreated,
            //     initialCameraPosition: CameraPosition(
            //       target: _center,
            //       zoom: 11.0,
            //     ),),
            Text(
              'Finder here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
