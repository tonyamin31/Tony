// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:medverse/Profile.dart';

import 'package:medverse/search.dart';

class CustomFloating extends StatefulWidget {
  const CustomFloating({Key? key}) : super(key: key);

  @override
  _CustomFloatingState createState() => _CustomFloatingState();
}

class _CustomFloatingState extends State<CustomFloating> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(25, 154, 142, 100),
      onPressed: () {
        setState(() {
          // _isActive = !_isActive; // Toggle active state
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => profile()),
        );
      },
      child: Icon(
        Icons.person,
        color: _isActive ? Colors.white : Colors.black, // Icon color
      ),
    );
  }
}
