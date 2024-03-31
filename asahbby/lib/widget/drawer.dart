import 'package:flutter/material.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 19, 0, 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'أصاحبي',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 167, 42),
                  fontSize: 24,
                  fontFamily: 'MarheyVariableFont',
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Soon',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
              // ListTile(
              //   leading: const Icon(Icons.rule_outlined),
              //   iconColor: Color.fromARGB(255, 156, 144, 218),
              //   title: const Text(
              //     '',
              //     style: TextStyle(color: Color.fromARGB(255, 156, 144, 218)),
              //   ),
              //   onTap: () {
              //     // Close the drawer

              //   },
              // ),
              //  ),
              // ListTile(
              //   leading: const Icon(Icons.account_circle),
              //   title: const Text('Profile'),
              //   onTap: () {
              //     Navigator.pop(context); // Close the drawer
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: const Text('Settings'),
              //   onTap: () {
              //     Navigator.pop(context); // Close the drawer
              //   },
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('The game issued by ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('Ziad Essam',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                      ],
                    ),
                    Text(
                      'version 2.1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
