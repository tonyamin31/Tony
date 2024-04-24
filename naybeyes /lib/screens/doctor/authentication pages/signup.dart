import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:naybeyes/widgets/my_button.dart';
import 'package:naybeyes/widgets/text_field.dart';

// lists
import 'package:naybeyes/drop_down_lists/countries.dart';
import 'package:naybeyes/drop_down_lists/genders.dart';
import 'package:naybeyes/drop_down_lists/specializations.dart';


class DoctorSignUpPage extends StatefulWidget {
  @override
  _DoctorSignUpPageState createState() => _DoctorSignUpPageState();
}

class _DoctorSignUpPageState extends State<DoctorSignUpPage> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController residenceCountryController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String? selectedGender;
  String? selectedSpecialization;
  String? residencecountry;
  XFile? _imageFile;


  // Declare a boolean variable to track if image is uploaded
  bool isImageUploaded = false;  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'lib/assets/logo_varients/fulllogo-green.png', 
                    width: 200, // Adjust the width of the image as needed
                    height: 100, // Adjust the height of the image as needed
                  ),
                  Icon(Icons.local_hospital,color: Color(0xFF199A8E),),
                  SizedBox(height: 30),

                  CustomTextField(
                    controller: firstNameController,
                    labelText: 'First Name',
                    validator: _validateTextField,
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    controller: lastNameController,
                    labelText: 'Last Name',
                    validator: _validateTextField,
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    controller: emailController,
                    labelText: 'Email',
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    validator: _validatePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                      controller: confirmPasswordController,
                      labelText: 'Confirm Password',
                      obscureText: true,
                      validator: _validateConfirmPassword,
                    ),
                  SizedBox(height: 10),

                  CustomTextField(
                    controller: phoneNumberController,
                    labelText: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    validator: _validatePhoneNumber,
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align items in the center horizontally
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black, // Change the color of the divider
                          height: 1.5, // Adjust the height of the divider
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add some horizontal padding
                        child: Text(
                          'Additional Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black, // Change the color of the divider
                          height: 0.5, // Adjust the height of the divider
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  DropdownButtonFormField<String>(
                    value: selectedSpecialization, // Your selected value variable
                    items: specializationsList.map((specialization) => DropdownMenuItem(
                      value: specialization,
                      child: Text(specialization),
                    )).toList(),
                    onChanged: (value) { 
                      setState(() {
                        selectedSpecialization = value;
                        specializationController.text = value!;
                      });
                    },
                    validator: _validateDropdownField,
                    decoration: InputDecoration(
                      labelText: 'Specialization',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                    ),
                  ),
                  SizedBox(height: 10),

                  DropdownButtonFormField<String>(
                    value: selectedGender, 
                    items: genders.map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    )).toList(),
                    onChanged: (value) { 
                      setState(() {
                        selectedGender = value;
                        genderController.text = value!;
                      });
                    },
                    validator: _validateDropdownField,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                    ),
                  ),
                  SizedBox(height: 10),
                
                  TextFormField(
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      labelText: 'Birthdate',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                    ),
                    validator: (value) {
                      if (selectedDate == null) {
                        return 'Please select birthdate';
                      }
                      return null;
                    },
                    controller: TextEditingController(
                        text: _formatDate(selectedDate)),
                  ),
                  SizedBox(height: 10),
                  
                  DropdownButtonFormField<String>(
                    value: residencecountry, // Your selected value variable
                    items: countries.map((country) => DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    )).toList(),
                    onChanged: (value) { 
                      setState(() {
                        residencecountry = value;
                        residenceCountryController.text = value!;
                      });
                    },
                    validator: _validateDropdownField,
                    decoration: InputDecoration(
                      labelText: 'Residence Country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                    ),
                  ),
                  SizedBox(height: 10),

                  CustomTextField(
                    controller: addressController,
                    labelText: 'Address',
                    validator: _validateTextField,
                  ),
                  SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: _selectImage,
                    style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // To minimize the width of the button
                      children: [
                        Icon(Icons.camera_alt), // Add the camera icon
                        SizedBox(width: 8), // Add some space between the icon and the text
                        Text('Upload Avatar'), // Add the text
                      ],
                    ),
                  ),     
                  SizedBox(height: 15),

                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      await _submitForm();
                    },
                  ),
                  SizedBox(height: 10),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/Doctor/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF199A8E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }







  // Validation Functions

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date);
    } else {
      return 'Birthdate';
    }
  }

  String? _validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  String? _validateDropdownField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please select an option';
  }
  return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
  if (value != passwordController.text) {
    return 'Passwords do not match';
  }
  return null; // Return null if the validation passes
  }

  String? _validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Phone number must contain only digits';
  }
  return null;
  }

  // Birthdate
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthdateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Function to handle image upload

  Future<void> _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<String> _uploadImage() async {
    try {
      final firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('doctor avatar')
          .child(DateTime.now().millisecondsSinceEpoch.toString() + '.jpg');
      await ref.putFile(File(_imageFile!.path));
      final imageUrl = await ref.getDownloadURL();
      isImageUploaded = true;
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      throw e;
    }
  }

  Future<void> _saveRecordToFirestore(String imageUrl) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // User registration successful, save additional user data to Firestore
        await FirebaseFirestore.instance.collection('Doctors').doc(userCredential.user!.uid).set({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'phoneNumber': phoneNumberController.text,
          'specialization':specializationController.text,
          'gender': genderController.text,
          'birthdate': birthdateController.text,
          'residence': residenceCountryController.text,
          'address': addressController.text,
          'avatar': imageUrl,

        });
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/doctor/login',
          (Route<dynamic> route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // email existing error  message
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Sign Up Error',
                style: TextStyle(
                  color: Color(0xFF199A8E), // Set title text color
                  fontSize: 18, // Set title text size
                  fontWeight: FontWeight.bold, // Set title text weight
                ),
              ),
              content: Text('Use different email address, or Login instead.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        } else {
          // Handle other FirebaseAuthException errors
          print('FirebaseAuthException: ${e.message}');
        }
      } catch (error) {
        // Handle other errors
        print(error.toString());
      }
    }
  }


  Future<void> _submitForm() async {
    // Check if image is selected
    if (_formKey.currentState!.validate()) {
      // Check if image is selected
      if (_imageFile == null) {
        // Show error dialogue if image is not selected
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Please upload an avatar'),
            content: Text('Upload a profile picture to sign up'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      // Upload image to Firebase Storage
      final imageUrl = await _uploadImage();

      // Save record to Firestore
      await _saveRecordToFirestore(imageUrl);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signed Up Successfully.'),
        ),
      );
    }
  }

}


