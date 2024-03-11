// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jap_icons/medical_icons_icons.dart';
import 'package:medverse/Custom_Widgets/naviagtion/footer3.dart';

import 'Custom_Widgets/naviagtion/CustomFloating.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
        ),
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
                      iconSize: 35,
                      icon: const Icon(Icons.arrow_circle_left_outlined),
                      onPressed: () {
                        //Navigate back to the previous screen
                        Navigator.of(context).pop();
                      },
                    ),

                    SizedBox(height: 1.0),

                    const Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(height: 25.0),

                    const SizedBox(height: 9.0),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Search for doctor, speciality',
                        hintText: 'Search for doctor, speciality',

                        // Add the search icon using prefixIcon
                        prefixIcon: Icon(Icons.search),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // Set the enabled border color
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),

                    SizedBox(height: 8.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Choose the area',
                        hintText: 'Choose the area',

                        // Add the search icon using prefixIcon
                        prefixIcon: Icon(Icons.search),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // Set the enabled border color
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 50.0),

                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle Dermatology button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: Row(
                            children: [
                              Icon(MedicalIcons.i_dermatology),
                              SizedBox(width: 10.0),
                              Text(
                                'Dermatology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 22, 14,
                                        14)), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Dentistry button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: Row(
                            children: [
                              Icon(MedicalIcons.i_dental),
                              SizedBox(width: 10.0),
                              Text(
                                'Dentistry',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Psychiatry button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: Row(
                            children: [
                              Icon(MedicalIcons.i_mental_health),
                              SizedBox(width: 10.0),
                              Text(
                                'Psychiatry',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Neurology button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: Row(
                            children: [
                              Icon(MedicalIcons.i_neurology),
                              SizedBox(width: 10.0),
                              Text(
                                'Neurology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Radiology button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: Row(
                            children: [
                              Icon(MedicalIcons.i_radiology),
                              SizedBox(width: 10.0),
                              Text(
                                'Radiology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Cardiology button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: const Row(
                            children: [
                              Icon(MedicalIcons.i_cardiology),
                              SizedBox(width: 10.0),
                              Text(
                                'Cardiology',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Nursery button click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[
                                200], // Set the button background color to light grey
                            padding: EdgeInsets.all(
                                16.0), // Add padding to all sides
                          ),
                          child: const Row(
                            children: [
                              Icon(MedicalIcons.i_nursery),
                              SizedBox(width: 10.0),
                              Text(
                                'Nursery',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors
                                        .black), // Set text color to black
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
        floatingActionButton: CustomFloating(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Footer3(),
      ),
    );
  }
}
