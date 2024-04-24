import 'package:flutter/material.dart';
import 'package:naybeyes/screens/doctor/prescriptions/prescription_details.dart';

class PrescriptionCard extends StatelessWidget {
  final String patientAvatar;
  final String patientName;
  final String patientPhone;
  final String patientEmail;
  final String patientAddress;
  final String appointmentDate;

  final String prescription;

  PrescriptionCard({
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrescriptionDetailsPage(
              patientAvatar: patientAvatar,
              patientName: patientName,
              appointmentDate: appointmentDate,
              prescription: prescription,
              patientPhone:patientPhone,
              patientEmail:patientEmail,
              patientAddress:patientAddress,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF199A8E), width: 2.0),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(patientAvatar),
                ),
              ),
              SizedBox(width: 12.0), 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$patientName',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0), 
                    Text(
                      '$appointmentDate',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_double_arrow_right,
                color: Color(0xFF199A8E), // Green color
                size: 18,
              ),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
