import 'package:flutter/material.dart';

class SpecializationName extends StatelessWidget {
  final String specialization;
  final VoidCallback onTap;

  const SpecializationName({super.key, 
    required this.specialization,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF199A8E),
          borderRadius: BorderRadius.circular(12.0),
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
          children: [
            // Icon(Icons.medical_information, size: 18, color: Colors.white),
            const SizedBox(width: 8), // Add space between icon and text
            Expanded(
              child: Text(
                specialization,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
