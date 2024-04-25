import 'package:flutter/material.dart';

class PillReminderCard extends StatelessWidget {
  final String medicineName;
  final String time;
  final bool isTaken;
  final ValueChanged<bool?>? onCheckboxChanged;

  const PillReminderCard({super.key, 
    required this.medicineName,
    required this.time,
    required this.isTaken,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicineName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Take your pill at $time',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Checkbox(
            value: isTaken,
            onChanged: onCheckboxChanged,
            activeColor: const Color(0xFF199A8E),
          ),
        ],
      ),
    );
  }
}
