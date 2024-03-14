import 'package:flutter/material.dart';

class Texxt extends StatelessWidget {
  final String text;

  Texxt(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class Clickabledata extends StatefulWidget {
  final Texxt dosageText;
  final Texxt sideEffectsText;

  Clickabledata({required this.dosageText, required this.sideEffectsText});

  @override
  _ClickabledataState createState() => _ClickabledataState();
}

class _ClickabledataState extends State<Clickabledata> {
  String _selectedWord = '';

  void _selectWord(String word) {
    setState(() {
      _selectedWord = word;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _selectWord('Dosage'),
              child: Text(
                'Dosage',
                style: TextStyle(
                    color: _selectedWord == 'Dosage'
                        ? Color(0xFF199A8E)
                        : Colors.black,
                    fontSize: 25),
              ),
            ),
            SizedBox(width: 60),
            GestureDetector(
              onTap: () => _selectWord('SideEffects'),
              child: Text(
                'Side effects',
                style: TextStyle(
                    color: _selectedWord == 'SideEffects'
                        ? Color(0xFF199A8E)
                        : Colors.black,
                    fontSize: 25),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        _selectedWord == 'Dosage'
            ? widget.dosageText
            : _selectedWord == 'SideEffects'
                ? widget.sideEffectsText
                : Container(),
      ],
    );
  }
}
