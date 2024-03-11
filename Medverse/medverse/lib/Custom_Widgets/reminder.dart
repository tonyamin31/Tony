import 'package:flutter/material.dart';
import 'package:medverse/Custom_Widgets/checkbox.dart';

class Reminder extends StatelessWidget {
  final String customText;

  const Reminder({
    Key? key,
    required this.customText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(176, 235, 229, 1),
          border: Border.all(color: Color.fromRGBO(87, 208, 195, 1), width: 3),
        ),
        height: 80,
        width: 380,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text('12:00 PM'),
              SizedBox(width: 30),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customText), // Use custom text here
                    Text('1 Tablet'),
                  ],
                ),
              ),
              SizedBox(width: 130),
              CheckboxExample(),
            ],
          ),
        ),
      ),
    );
  }
}
