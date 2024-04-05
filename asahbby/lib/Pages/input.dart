import 'package:Asahby/Pages/Rules.dart';
import 'package:flutter/material.dart';
import 'package:Asahby/widget/input.dart';

import '../widget/drawer.dart';

class SecondRoute extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: Drawerwidget(),
        backgroundColor: Colors.black,
        body: WillPopScope(
            onWillPop: () async {
              bool keepPage = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor:
                        Color.fromARGB(255, 51, 38, 117),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 98, 83, 184),
                          width: 3.0), 
                    ),
                    title: Text('If you leave, The game will be lost',
                        style: TextStyle(
                          color: Color.fromARGB(255, 251, 167, 42),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MarheyVariableFont',
                        )),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: Colors.lightGreen)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(false); 
                              },
                              child: Text('Stay',
                                  style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontFamily: 'MarheyVariableFont',
                                    fontWeight: FontWeight.bold,
                                  )), 
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(width: 1, color: Colors.red)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(true); 
                              },
                              child: Text(
                                'Leave',
                                style: TextStyle(
                                    fontFamily: 'MarheyVariableFont',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red
                                    // لون الزر

                                    ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              );
              return keepPage;
            },
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 251, 167, 42),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.menu,
                                  color: Color.fromARGB(255, 51, 38, 117),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                           
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Rules(),
                                  ));
                            },
                            child: Image.asset(
                              'assets/images/LOGO.png',
                              width: 80,
                           
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        PlayerInput(),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

/**/