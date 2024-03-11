import 'package:flutter/material.dart';

class sliding extends StatelessWidget {
  final String imagePath;
  const sliding({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: Color(0xFFB0EBE5), width: 3)),
      height: 130,
      width: 380,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              imagePath,
              width: 70,
            ),
          ),
        ),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Ziad Essam',
                style: TextStyle(fontSize: 20),
              )),
          Text(
            'Dentist',
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '22 zamalk street Fayoum,Egypt',
                style: TextStyle(fontSize: 15),
              ))
        ]),
      ]),
    );
  }
}
