import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// user provider
import 'package:naybeyes/user_provider.dart';
import 'package:naybeyes/widgets/my_button.dart';
import 'package:provider/provider.dart';

import 'package:naybeyes/widgets/text_field.dart';



// Parent Widget
class PatientLoginPageParent extends StatelessWidget {
  const PatientLoginPageParent({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<UserProvider>(
      create: (_) => UserProvider(),
      child: const DoctorLoginPage(), // Your login widget
    );
  }
}
class DoctorLoginPage extends StatefulWidget {
  const DoctorLoginPage({super.key});

  @override
  _DoctorLoginPageState createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = ''; // Define errorMessage variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/logo_varients/fulllogo-green.png',
                  width: 200,
                  height: 100,
                ),
                const Icon(Icons.local_hospital,color: Color(0xFF199A8E),),

                Visibility(
                  visible: errorMessage.isNotEmpty, // Show the container only if there is an error message
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5), // Red background with 0.5 opacity
                      borderRadius: BorderRadius.circular(5), // Optional: Add border radius for rounded corners
                    ),
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10), // Add padding to the container
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Reduced space after logo
                Form( // Wrap form fields within a Form widget (optional)
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        obscureText: true,
                      ),
                    const SizedBox(height: 8), // Adjust the spacing between the password field and the text
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0), // Adjust the left padding as needed
                        child: GestureDetector(
                          onTap: () {
                          Navigator.pushNamed(context, '/forgetpassword');
                          },
                          child: const Text(
                            'Forgot your password ?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey, // Adjust the color to match your UI/UX standards

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                    ],
                  ),
                ),
                const SizedBox(height: 15), 

                CustomButton(
                  text: 'Login',
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        // Fetch the user's ID
                        String userId = userCredential.user!.uid;
                        String userRole = 'doctor';
                        Provider.of<UserProvider>(context, listen: false).setUser(userCredential.user, userRole); // Update UserProvider

                        // Check if the user ID exists in the collection
                        DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance.collection('Doctors').doc(userId).get();
                        if (doctorSnapshot.exists) {
                          // User is a doctor, navigate to doctor's home page
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/doctor/home',
                            (Route<dynamic> route) => false,
                          );
                          setState(() {
                            errorMessage = ''; // Clear the error message
                          });
                        } else {
                          setState(() {
                            errorMessage = 'Invalid Login Credentials';
                          });
                        }
                      } catch (e) {
                        setState(() {
                          errorMessage = 'Enter Valid Credentials';
                        });
                      }
                    },
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/doctor/signup');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF199A8E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF199A8E), // Set the color of the icon
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/roleselection');
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
