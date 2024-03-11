import 'package:flutter/material.dart';

import '../Custom_Widgets/naviagtion/CustomFloating.dart';
import '../Custom_Widgets/naviagtion/footer3.dart';
import 'second_page.dart';

class viewbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(children: [
          //APP BAR SIZE
          const SizedBox(height: 100),
          Container(
              width: 360,
              height: 150,
              color: Color(0xFFB0EBE5),
              child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr.Ziad Essam',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Dentist',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 100),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle button press
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondPage()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF199A8E),
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text('View'),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 30),
                            Image.asset(
                              'assets/images/Bottleofpills.png',
                              width: 70,
                            )
                          ]),
                          SizedBox(height: 10),
                        ]),
                      ],
                    ),
                  ])))
        ])
      ]),
      floatingActionButton: CustomFloating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Footer3(),
    );
  }
}
