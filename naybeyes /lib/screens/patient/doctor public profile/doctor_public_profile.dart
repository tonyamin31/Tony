import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naybeyes/main%20screens/full_screen_img.dart';
import 'package:naybeyes/screens/patient/appointments/booking_screen.dart';

class PublicDoctorProfilePage extends StatelessWidget {
  final String doctorUid;

  PublicDoctorProfilePage({required this.doctorUid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('Doctors').doc(doctorUid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var doctorData = snapshot.data!.data() as Map<String, dynamic>?;

          if (doctorData != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Doctor Profile'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(imageUrl: doctorData['avatar'] ?? ''),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 390,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(doctorData['avatar'] ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(horizontal: 8),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. ${doctorData['firstName']} ${doctorData['lastName']}',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF199A8E),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '• ${doctorData['specialization']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF199A8E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentBookingScreen(
                              doctorUid: doctorUid
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Color(0xFF199A8E),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Book Appointment',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            );
          } else {
            return Text('Doctor data not found.');
          }
        }
      },
    );
  }
}
