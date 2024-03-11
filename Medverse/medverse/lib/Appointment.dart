import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:project/widgets/buttons.dart';

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF199A8E),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Upcoming Appointment',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            // Changed to Row for horizontal arrangement
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                children: [
                  Text(
                    '20 ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'March ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '2024 ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Spacer for horizontal space between columns

              SizedBox(width: 15.0), // Spacing between columns
              // Column for doctor information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  Text(
                    'Dr.Reem', // Replace with doctor's name
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    // Row for time and icon
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5.0),
                      Text(
                        '10:00 AM', // Replace with appointment time
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                  Row(
                    // Row for time and icon
                    children: [
                      SizedBox(width: 3.0),
                      Image.asset('assets/images/pin.png',
                          height: 20.0, width: 20.0),
                      Text(
                        'Capital Business Park', // Replace with appointment time
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),

              SizedBox(width: 8.0), // Spacing between columns
              // Column for confirmation
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  Text('Confirmed',
                      style: TextStyle(fontSize: 14.0, color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
