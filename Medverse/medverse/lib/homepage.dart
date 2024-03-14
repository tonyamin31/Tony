import 'package:flutter/material.dart';

import 'package:medverse/Records.dart';

import 'package:medverse/search.dart';

import 'Custom_Widgets/naviagtion/CustomFloating.dart';
import 'Custom_Widgets/naviagtion/footer3.dart';
import 'Custom_Widgets/reminder.dart';
import 'Custom_Widgets/slider.dart';
import 'prcs/prcs.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF199A8E),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: const Column(
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
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: const Color(0xFFD7F5F2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => search())));
                    // Add your button onPressed logic here
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(Icons.search), // Search icon
                        SizedBox(
                            width:
                                8.0), // Add some space between the icon and text
                        Text(
                          'Search for doctors, symptoms etc..',
                          style: TextStyle(color: Color(0XFF635D5D)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Row(children: [
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        // Add your button onPressed logic here
                        print('Button tapped');
                      },
                      child: Container(
                        width: 125.86,
                        height: 147.59,
                        decoration: ShapeDecoration(
                          color: const Color(0x7FB0EBE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 3, color: Color(0xFFB0EBE5)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/appointment.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Appointment',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Add your button onPressed logic here
                        print('Button tapped');
                      },
                      child: Container(
                        width: 125.86,
                        height: 147.59,
                        decoration: ShapeDecoration(
                          color: const Color(0x7FB0EBE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 3, color: Color(0xFFB0EBE5)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/medications.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Medications',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(children: [
                          const SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => viewbutton()));
                              // Add your button onPressed logic here
                              print('Button tapped');
                            },
                            child: Container(
                              width: 125.86,
                              height: 147.59,
                              decoration: ShapeDecoration(
                                color: const Color(0x7FB0EBE5),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 3, color: Color(0xFFB0EBE5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/presc.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Prescriptions',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => records())));
                              // Add your button onPressed logic here
                              print('Button tapped');
                            },
                            child: Container(
                              width: 125.86,
                              height: 147.59,
                              decoration: ShapeDecoration(
                                color: const Color(0x7FB0EBE5),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 3, color: Color(0xFFB0EBE5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/records.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Records',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add your button onPressed logic here
                              print('Button tapped');
                            },
                            child: Container(
                              width: 125.86,
                              height: 147.59,
                              decoration: ShapeDecoration(
                                color: const Color(0x7FB0EBE5),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 3, color: Color(0xFFB0EBE5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/fastambu.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Ambulance',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30.0, top: 30),
                  child: const Row(
                    children: [
                      Text(
                        'Top Doctors',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
                //---------------------------------------------------------------------
                const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          sliding(
                            imagePath: 'assets/images/ziad.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          sliding(
                            imagePath: 'assets/images/ziad.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          sliding(
                            imagePath: 'assets/images/ziad.png',
                          ),
                        ]),
                      )
                    ]))
                //---------------------------------------------------------------------
              ]),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, top: 30),
            child: const Row(
              children: [
                Text(
                  'Reminder',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [],
                )
              ],
            ),
          ),
          Reminder(
            customText: 'Panadol',
          ),
          Reminder(
            customText: 'Zyrtec   ',
          ),
          Reminder(
            customText: 'Selegon',
          ),
          SizedBox(height: 100)
        ]),
      ]),
      floatingActionButton: CustomFloating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer3(),
    ));
  }
}
