import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medverse/login/Reset_Email.dart';
import 'package:medverse/login/SignUp.dart';
import 'package:medverse/homepage.dart';

//import 'package:grad_proj/widgets/buttons.dart';

class login extends StatelessWidget {
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
                  Center(
                    child: Row(
                      children: [
                        // Back Button
                        IconButton(
                          iconSize: double.tryParse('36'),
                          icon: const Icon(Icons.arrow_circle_left_outlined),
                          onPressed: () {
                            // Navigate back to the previous screen
                            Navigator.of(context).pop();
                          },
                        ),

                        // Spacer for some separation between the IconButton and Text
                        SizedBox(width: 80),

                        // Create account text
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Text(
                              'Login!',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.0),

                  // Email textfield

                  Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      // Add any additional styles as needed
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      hintText: 'Enter your email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Set the enabled border color
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 25.0),

                  // Password textfield
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      // Add any additional styles as needed
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(
                      height:
                          1.0), // Adjust the spacing between the button and the "Forgot Password" link

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => resetpasswordemail()));
                        // Add your forget password logic here
                      },
                      child: Text(
                        'Forget password',
                        style: TextStyle(
                          height: 0.1,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Color(0xff8C7F7F),
                          // Add any additional styles as needed
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 1.0),

                  // Sign in button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      // Add your logic here
                    },
                    child: Text(
                      'Login',
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

                  SizedBox(height: 50.0),

                  // Already have an account text
                  SizedBox(
                    height: double.tryParse('72'),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // "Don't have an account?" text
                          Text(
                            "Don't have an account?",
                            textAlign: TextAlign.center,
                          ),

                          // "Sign up" button
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup()));
                              // Handle "Sign up" logic
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color(
                                    0xff199A8E), // Set your desired text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Colors.black, // Set your desired text color
                        ),
                      ),
                    ),
                  ),
                  // Adjust the spacing between "or" and the button

                  SizedBox(height: 10.0),
                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE5E7EB), // Background color
                      minimumSize: Size(double.infinity, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google_icon.png', // Replace with the path to your Google logo image
                          height: 25.0, // Set the height of the logo as needed
                          width: 25.0, // Set the width of the logo as needed
                        ),
                        SizedBox(
                            width:
                                10.0), // Adjust the spacing between the image and text
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.black, // Set your desired text color
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0),

                  SizedBox(
                      width:
                          10.0), // Adjust the spacing between "or" and the button
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE5E7EB), // Background color
                      minimumSize: Size(double.infinity, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/apple-logo-transparent.png', // Replace with the path to your Google logo image
                          height: 30.0, // Set the height of the logo as needed
                          width: 30.0, // Set the width of the logo as needed
                        ),
                        SizedBox(
                            width:
                                10.0), // Adjust the spacing between the image and text
                        Text(
                          'Sign in with Apple',
                          style: TextStyle(
                            color: Colors.black, // Set your desired text color
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.0),
                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE5E7EB), // Background color
                      minimumSize: Size(
                          80.0, 40.0), // Adjust the height and width as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/facebooklogo.png',
                          height: 25.0,
                          width: 25.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
