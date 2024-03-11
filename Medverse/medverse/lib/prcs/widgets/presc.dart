import 'package:flutter/material.dart';

import 'medicine.dart';


class presc extends StatelessWidget {
  presc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xFF199A8E),
            width: 3.0,
          ),
          color: Color(0xFFB0EBE5),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicineName(
                Medicine: 'Panadol',
                type: 'Taps',
              ),
              MedicineName(
                Medicine: 'Panadol',
                type: 'Taps',
              ),
              MedicineName(
                Medicine: 'Panadol',
                type: 'Taps',
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 110, top: 40),
              child: Image.asset(
                'assets/images/Bottleofpills.png',
                width: 80,
              ))
        ]));
  }
}
