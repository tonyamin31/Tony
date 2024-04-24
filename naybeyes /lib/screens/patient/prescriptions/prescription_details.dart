import 'package:flutter/material.dart';

class PrescriptionDetailsPage extends StatelessWidget {
  final String doctorAvatar;
  final String doctorName;
  final String doctorPhone;
  final String doctorEmail;
  final String doctorAddress;
  final String appointmentDate;
  final String prescription;

  PrescriptionDetailsPage({
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$appointmentDate',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF199A8E), width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(doctorAvatar),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. $doctorName',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ), 
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.grey, size: 16,),
                        SizedBox(width: 8),
                        Text(
                          '$doctorPhone',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.grey, size: 16,),
                        SizedBox(width: 8),
                        Text(
                          '$doctorEmail',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
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
                        Text(
                          'Prescription',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF199A8E),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          prescription,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 16,),
                SizedBox(width: 8),
                Text(
                  '$doctorAddress',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
