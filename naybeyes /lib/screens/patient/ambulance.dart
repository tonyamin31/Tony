import 'package:flutter/material.dart';

class AmbulancePage extends StatelessWidget {
  const AmbulancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ambulance'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Ambulance here',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
