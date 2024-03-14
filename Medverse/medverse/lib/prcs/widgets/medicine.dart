import 'package:flutter/material.dart';

class MedicineName extends StatelessWidget {
  final String Medicine;
  final String type;

  const MedicineName({
    super.key,
    required this.Medicine,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$Medicine',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Type: $type',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
