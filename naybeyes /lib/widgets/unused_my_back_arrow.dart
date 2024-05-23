import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final double radius; // Radius of the circular container
  final VoidCallback onPressed; // Callback for handling back button press

  const CustomBackButton({
    super.key,
    required this.radius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Removes material button background
      child: InkWell(
        borderRadius: BorderRadius.circular(radius), // Matches container radius
        onTap: onPressed,
        child: Container(
          width: radius * 2, // Width equal to twice the radius
          height: radius * 2, // Height equal to twice the radius
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green, // Your app's green color
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white, // White color for the icon
            ),
          ),
        ),
      ),
    );
  }
}
