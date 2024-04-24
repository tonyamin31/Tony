import 'package:flutter/material.dart';

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // String userRole = ''; // Variable to store user role

    return Scaffold(
      backgroundColor: Color(0xFF199A8E),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200, // Set the width of the buttons
                child: ElevatedButton(
                  onPressed: () {
                    // Set user role as patient
                    // userRole = 'patient';
                    // Navigate to login page for patient
                    Navigator.pushNamed(context, '/patient/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set border radius here
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text(
                        'I\'m a Patient',
                        style: TextStyle(
                          color: Color(0xFF199A8E),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 1,
                width: 150,
                color: Colors.white.withOpacity(0.4),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200, // Set the width of the buttons
                child: ElevatedButton(
                  onPressed: () {
                    // Set user role as doctor
                    // userRole = 'doctor';
                    // Navigate to login page for doctor
                    Navigator.pushNamed(context, '/doctor/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF199A8E),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set border radius here
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_hospital,color: Colors.white,),
                      SizedBox(width: 10),
                      Text(
                        'I\'m a Doctor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
