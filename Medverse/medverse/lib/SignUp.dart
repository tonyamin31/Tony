import 'package:flutter/material.dart';
import 'package:medverse/Custom_Widgets/my_text_filed.dart';
import 'package:medverse/login.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;

  const InputField({Key? key, required this.labelText, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController cpasswordController = TextEditingController();
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
                  // Let's Sign Up text
                  const Center(
                    child: Text(
                      'Let\'s Get Started',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.0),

                  // Create account text
                  const Center(
                    child: Text(
                      'Create account !',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),

                  // Full Name textfield
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // MEDTextFormFiled(
                  //   controller: fullNameController,
                  //   title: 'Full Name',
                  //   hintText: 'Enter your name',
                  //   validation: (value) {
                  //     if (value!.length < 3) {
                  //       return 'this field is required';
                  //     }
                  //   },
                  // ),

                  const SizedBox(
                      height: 20.0), // Add some space between the text fields

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Enter your E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: 'E-mail',
                  //     hintText: 'Enter your E-mail',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(height: 20.0),

                  // Password textfield
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // MEDTextFormFiled(
                  //   controller: passwordController,
                  //   title: 'Password',
                  //   validation: (password) {
                  //     if (password!.length < 3) {
                  //       return 'this filed is required';
                  //     }
                  //   },
                  //   isPassword: true,
                  //   hintText: 'please enter password',
                  // ),

                  SizedBox(height: 10.0),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // MEDTextFormFiled(
                  //   decoration: OutlineInputBorder,
                  //   controller: cpasswordController,
                  //   title: "Confirm Password",
                  //   isPassword: true,
                  //   validation: (confirmPassword) {
                  //     if (confirmPassword!.length < 3) {
                  //       return 'this filed is required';
                  //     } else if (cpasswordController.text !=
                  //         passwordController.text) {
                  //       return 'password not match';
                  //     }
                  //   },
                  //   hintText: 'confirm password',
                  // ),

                  SizedBox(height: 10.0),

                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: InputField(
                              labelText: 'Age',
                              hintText: 'Enter your age',
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: InputField(
                              labelText: 'Blood type',
                              hintText: 'Enter your blood type',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),

                      // Add some space between the rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Weight',
                                hintText: 'Enter your Weight',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: InputField(
                              labelText: 'Height',
                              hintText: 'Enter your Height',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20.0),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Birthday',
                      hintText: 'Enter your Birthday',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Enter your Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Sign Up button

                  SizedBox(height: 10.0),
                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => login())));
                      // Add your logic here
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white), // Text color
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

                  SizedBox(height: 30.0),

                  // Already have an account text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => login())));
                        },
                        child: const Text('Sign in'),
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
