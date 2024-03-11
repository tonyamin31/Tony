import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medverse/Reset_Phone.dart';
import 'package:medverse/Verfication.dart';
//import 'package:grad_proj/widgets/buttons.dart';

class resetpasswordemail extends StatelessWidget {
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
                  const Center(
                    child: Text(
                      'Forgot Your Password!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                      'Enter your email or your phone number, we will send you confirmation code'),

                  SizedBox(height: 25.0),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the buttons horizontally
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        resetpasswordemail())); // Add your desired functionality here
                          },
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: Color(0xff199A8E),
                              fontSize: 16.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffD6D6D6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ), // Adjust the spacing between the buttons
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        resetpasswordphone()));
                            // Add your desired functionality here
                          },
                          child: Text(
                            "Phone",
                            style: TextStyle(
                              color: Color(0xffA1A8B0),
                              fontSize: 16.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF9FAFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Email textfield

                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Colors.grey), // Set the enablled border color
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 25.0),

                  SizedBox(
                      height:
                          10.0), // Adjust the spacing between the button and the "Forgot Password" link

                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => verfcode())));
                      // Add your logic here
                    },
                    child: Text(
                      'Reset Password',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
