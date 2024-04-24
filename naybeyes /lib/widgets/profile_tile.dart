import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';


class ExpandableTile extends StatefulWidget {
  final String title;
  final List<Widget> children;

  ExpandableTile({required this.title, required this.children});

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(widget.title,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF199A8E),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          trailing: Icon(
            _isExpanded ? Icons.arrow_drop_up: Icons.arrow_drop_down_circle_outlined,
            size: 20,
            color: Color(0xFF199A8E),
          ),
        ),
        if (_isExpanded) ...widget.children,
      ],
    );
  }
}
