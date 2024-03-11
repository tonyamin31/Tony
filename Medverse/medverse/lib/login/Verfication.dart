import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medverse/login/NewPass.dart';
import 'package:pinput/pinput.dart';

class verfcode extends StatelessWidget {
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
                      'Enter Verification Code',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),

                  Center(
                    child: Text(
                      'Enter code sent to your email/number',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),

                  SizedBox(height: 50.0),
                  Center(
                    child: Pinput(
                      length: 4,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color.fromARGB(255, 9, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      height:
                          40.0), // Adjust the spacing between the button and the "Forgot Password" link

                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => newpass())));
                      // Add your logic here
                    },
                    child: Text(
                      'Verify',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Didnt receive the code?'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Resend'),
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xFF199A8E),
                        ),
                      )
                    ],
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
