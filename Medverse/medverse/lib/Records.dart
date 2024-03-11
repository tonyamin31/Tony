import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'Custom_Widgets/naviagtion/CustomFloating.dart';
import 'Custom_Widgets/naviagtion/footer3.dart';

class records extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF199A8E),
          title: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Positions the elements in the middle of the column
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns the text to the left
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Medical records',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ]),
        ),
        body: SingleChildScrollView(
          child: Card(
            color: Color(0xFFB0EBE5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to top
                    children: [
                      // Patient Image (replace with your image asset or widget)
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/chart.png'), // Replace with your image path
                            fit: BoxFit.cover, // Cover the container
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 16.0), // Add spacing between image and text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mariam Ali',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Age: 30 ',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          Text(
                            'Gender: Female ',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          Text(
                            'Bloodtype: A+ ',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0), // Add spacing after name and details

                  Center(
                    child: Text(
                      'Detailed Diagnosis:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(
                      height: 8.0), // Add smaller spacing after diagnosis title

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // ... other code
                      Text(
                        'Complaints:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 8.0), // Add spacing after complaints title

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter complaints here...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines:
                                null, // Allow multiple lines for longer complaints
                          ),
                        ),
                      ),
                      // ... other elements
                    ],
                  ),

                  SizedBox(height: 8.0),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // ... other code
                      Text(
                        'Medical History',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 8.0), // Add spacing after complaints title

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter medical history here...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines:
                                null, // Allow multiple lines for longer complaints
                          ),
                        ),
                      ),
                      // ... other elements
                    ],
                  ),

                  SizedBox(height: 8.0),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // ... other code
                      Text(
                        'Diagnostic Tests:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 8.0), // Add spacing after complaints title

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your diagnostic tests here...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines:
                                null, // Allow multiple lines for longer complaints
                          ),
                        ),
                      ),
                      // ... other elements
                    ],
                  ),

                  SizedBox(height: 8.0),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      // ... other code
                      Text(
                        'Medications taken:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 8.0), // Add spacing after complaints title

                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter the medications taken here...',
                              border: OutlineInputBorder(),
                            ),
                            maxLines:
                                null, // Allow multiple lines for longer complaints
                          ),
                        ),
                      ),
                      // ... other elements
                    ],
                  ),
                ],
              ),
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
