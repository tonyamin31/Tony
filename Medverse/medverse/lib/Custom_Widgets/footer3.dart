import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medverse/homepage.dart';

var iconlist = [
  Icons.home,
  Ionicons.calendar,
  Icons.local_hospital_rounded,
  Icons.pin_drop_outlined,
];

class Footer3 extends StatefulWidget {
  const Footer3({Key? key}) : super(key: key);

  @override
  _Footer3State createState() => _Footer3State();
}

class _Footer3State extends State<Footer3> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      leftCornerRadius: 25,
      rightCornerRadius: 25,
      backgroundColor: Color.fromRGBO(25, 154, 142, 100),
      inactiveColor: Colors.white,
      activeColor: Colors.black,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      icons: iconlist,
      activeIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        // Handle button clicks based on the index
        if (index == 0) {
          // Handle home button click
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (index == 1) {
          // Handle calendar button click
          // Add your logic here
        } else if (index == 2) {
          // Handle hospital button click
          // Add your logic here
        } else if (index == 3) {
          // Handle pin button click
          // Add your logic here
        }
      },
    );
  }
}
