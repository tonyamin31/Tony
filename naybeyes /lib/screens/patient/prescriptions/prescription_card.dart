import 'package:flutter/material.dart';
import 'package:naybeyes/screens/patient/prescriptions/prescription_details.dart';

class PrescriptionCard extends StatelessWidget {
  final String doctorAvatar;
  final String doctorName;
  final String doctorPhone;
  final String doctorEmail;
  final String doctorAddress;
  final String appointmentDate;

  final String prescription;

  const PrescriptionCard({super.key, 
    required this.doctorAvatar,
    required this.doctorName,
    required this.doctorPhone,
    required this.doctorEmail,
    required this.doctorAddress,
    required this.appointmentDate,

    required this.prescription,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrescriptionDetailsPage(
              doctorAvatar: doctorAvatar,
              doctorName: doctorName,
              appointmentDate: appointmentDate,
              prescription: prescription,
              doctorPhone:doctorPhone,
              doctorEmail:doctorEmail,
              doctorAddress:doctorAddress,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF199A8E), width: 2.0),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(doctorAvatar),
                ),
              ),
              const SizedBox(width: 12.0), 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. $doctorName',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0), 
                    Text(
                      appointmentDate,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              const Icon(
                Icons.keyboard_double_arrow_right,
                color: Color(0xFF199A8E), // Green color
                size: 18,
              ),
              const SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
