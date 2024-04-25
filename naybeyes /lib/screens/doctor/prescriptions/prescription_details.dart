import 'package:flutter/material.dart';

class PrescriptionDetailsPage extends StatelessWidget {
  final String patientAvatar;
  final String patientName;
  final String patientPhone;
  final String patientEmail;
  final String patientAddress;
  final String appointmentDate;
  final String prescription;

  const PrescriptionDetailsPage({super.key, 
    required this.patientAvatar,
    required this.patientName,
    required this.patientPhone,
    required this.patientEmail,
    required this.patientAddress,
    required this.appointmentDate,
    required this.prescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appointmentDate,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF199A8E), width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(patientAvatar),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible( // Change Expanded to Flexible
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, 
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.grey, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            patientPhone,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.email, color: Colors.grey, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            patientEmail,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Prescription',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF199A8E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          prescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
