import 'package:flutter/material.dart';

class MedicineCard extends StatefulWidget {
  final String medicineName;
  final String description;
  final String dosage;
  final String sideEffects;
  final Function(String) onDelete;

  MedicineCard({
    required this.medicineName,
    required this.description,
    required this.dosage,
    required this.sideEffects,
    required this.onDelete,
  });

  @override
  _MedicineCardState createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      margin: EdgeInsets.fromLTRB(12, 6, 12, 6),
      decoration: BoxDecoration(
        color: _isExpanded ? Color(0xFF199A8E) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.close_rounded, size: 22,),
              onPressed: () {
                widget.onDelete(widget.medicineName); // Call the onDelete function when delete icon is tapped
              },
            ),
            SizedBox(width: 6,),
            Text(
              widget.medicineName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: _isExpanded ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.description,
                      size: 16, // Adjust icon size
                      color: Colors.white, // Adjust icon color
                    ),
                    SizedBox(width: 6), // Add spacing between icon and text
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isExpanded ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: _isExpanded ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.medication,
                      size: 16, // Adjust icon size
                      color: Colors.white, // Adjust icon color
                    ),
                    SizedBox(width: 6), // Add spacing between icon and text
                    Text(
                      'Dosage:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isExpanded ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.dosage,
                  style: TextStyle(
                    color: _isExpanded ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.warning,
                      size: 16, // Adjust icon size
                      color: Colors.white, // Adjust icon color
                    ),
                    SizedBox(width: 6), // Add spacing between icon and text
                    Text(
                      'Side Effects:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isExpanded ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.sideEffects,
                  style: TextStyle(
                    color: _isExpanded ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
