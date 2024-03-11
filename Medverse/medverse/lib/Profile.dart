import 'package:flutter/material.dart';
import 'package:medverse/Custom_Widgets/AppBar.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: CAppBar(PageName: 'Profile'),
            body: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 500,
                  height: 300,
                  color: Color(0xFF00433C),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 500,
                          height: 300,
                          color: Color(0xFF00433C),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  width: 500,
                                  height: 300,
                                  color: Color(0xFF00433C),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/records.png', // Use 'Image.asset' for assets
                                            width: 90,
                                            height: 90,
                                          ),
                                          SizedBox(
                                              width:
                                                  200), // Adjust spacing between image and text
                                          Container(
                                            width: 230,
                                            height: 60,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFFB0EBE5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Nancy Hazem',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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

              SizedBox(height: 30), // Optional spacing between the two widgets
            ],
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align children to the start (left)
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Align column to the start (top)
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0,
                          top: 16.0), // Adjust the padding as needed
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ),
                    Column(children: [
                      Row(children: [
                        const SizedBox(width: 30.0),
                        GestureDetector(
                          onTap: () {
                            // Add your button onPressed logic here
                            print('Button tapped');
                          },
                          child: Container(
                            width: 360,
                            height: 120,
                            decoration: ShapeDecoration(
                              color: const Color(0x7FB0EBE5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 3, color: Color(0xFFB0EBE5)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  '',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Age', style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 70),
                                    Text('30', style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 70),
                                    Text('Blood type',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 40),
                                    Text('A+', style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Weight',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 40),
                                    Text('60kg',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 55),
                                    Text('Birth Place',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 15),
                                    Text('Egypt',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Height',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 40),
                                    Text('168 cm',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 40),
                                    Text('Address',
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 25),
                                    Text('Zayed',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ]),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              // Container with Vitals
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Align children to the start (left)
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Align column to the start (top)
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0,
                          top: 16.0), // Adjust the padding as needed
                      child: Text(
                        'Vitals',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ),
                    Column(children: [
                      Row(children: [
                        const SizedBox(width: 30.0),
                        GestureDetector(
                          onTap: () {
                            // Add your button onPressed logic here
                            print('Button tapped');
                          },
                          child: Container(
                            width: 360,
                            height: 260,
                            decoration: ShapeDecoration(
                              color: const Color(0x7FB0EBE5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 3, color: Color(0xFFB0EBE5)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  '',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Pulse Rate',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('High',
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(width: 100),
                                    Text('200 bpm',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Colors.black,
                                  thickness:
                                      1.0, // Adjust the thickness as needed
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Respiration Rate',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Normal',
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(width: 80),
                                    Text('66 bpm ',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Colors.black,
                                  thickness:
                                      1.0, // Adjust the thickness as needed
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Blood Pressure',
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Normal',
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(width: 80),
                                    Text('190/80 mmhg',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ]),
                  ],
                ),
              ),
            ],
          )
        ]))));
  }
}