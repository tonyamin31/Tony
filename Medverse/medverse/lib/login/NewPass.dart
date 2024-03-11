import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medverse/login/login.dart';

class newpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left_outlined),
                    onPressed: () {
                      // Navigate back to the previous screen
                      Navigator.of(context).pop();
                    },
                  ),

                  SizedBox(height: 20.0),

                  // Create account text
                  Center(
                    child: Text(
                      'Create New Password',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  Center(
                    child: Text(
                      'Create your new password to login',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),

                  SizedBox(height: 50.0),
                  // Password textfield
                  Column(
                    children: [
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          hintText: 'Confirm your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Adjust the spacing between the button and the "Forgot Password" link

                  SizedBox(height: 40.0),
                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => login())));
                      // Add your logic here
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white, // Set your desired text color
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF199A8E), // Background color
                      minimumSize: Size(double.infinity, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // Text or continue with

                  // Social media buttons (Google, Apple)

                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
