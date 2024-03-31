import 'package:flutter/material.dart';

import '../Pages/Rules.dart';

class backTop_Of_Page extends StatelessWidget {
  const backTop_Of_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60, left: 20),
      //APP BAR
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () {
            // Add your menu icon tap behavior here
            // For example, you can open a drawer or show a modal
            Navigator.pop(context);
          },
          child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 251, 167, 42),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 7),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 51, 38, 117),
                  size: 30.0,
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            // Add your onTap behavior here
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Rules(),
                ));
          },
          child: Image.asset(
            'assets/images/LOGO.png',
            width: 80,
            // Add any other properties you need for the image
          ),
        )
      ]),
    );
  }
}
