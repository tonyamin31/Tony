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
    );
  }
}
