import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(),
      Checkbox(
        tristate: true,
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value;
          });
        },
      ),
    ]);
  }
}
