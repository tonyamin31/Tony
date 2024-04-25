import 'package:flutter/material.dart';

class MedicineCard extends StatefulWidget {
  final String medicineName;
  final String description;
  final String dosage;
  final String sideEffects;

  const MedicineCard({super.key, 
    required this.medicineName,
    required this.description,
    required this.dosage,
    required this.sideEffects,
  });

  @override
  _MedicineCardState createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      decoration: BoxDecoration(
        color: _isExpanded ? const Color(0xFF199A8E) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          children: [
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
                    const Icon(
                      Icons.description,
                      size: 16, // Adjust icon size
                      color: Colors.white, // Adjust icon color
                    ),
                    const SizedBox(width: 6), // Add spacing between icon and text
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isExpanded ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 6),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: _isExpanded ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.medication,
                      size: 16, // Adjust icon size
                      color: Colors.white, // Adjust icon color
                    ),
                    const SizedBox(width: 6), // Add spacing between icon and text
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.warning,
                      size: 16, // Adjust icon size
                      color: Colors.white, // Adjust icon color
                    ),
                    const SizedBox(width: 6), // Add spacing between icon and text
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
