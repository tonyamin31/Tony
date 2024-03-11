import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF199A8E),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      title: Column(
        mainAxisAlignment: MainAxisAlignment
            .start, // Positions the elements in the middle of the column
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns the text to the left
        children: [
          Row(
            children: [
              Icon(Icons.person), // Add the person icon
              SizedBox(width: 10.0),
              Text(
                'Hi, Safa',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 1.0), // Add spacing between the texts
          Text(
            'How\'s your health today?',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 7.0),
        ],
      ),
    );
  }
}
