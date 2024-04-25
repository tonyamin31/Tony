import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naybeyes/screens/doctor/appointments/patient_appointment_card.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late String currentUserUid;
  Map<String, Map<String, dynamic>> patientData = {};

  @override
  void initState() {
    super.initState();
    getCurrentUserUid();
    _fetchpatientData();
  }

  Future<void> getCurrentUserUid() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserUid = user.uid;
      });
    }
  }

  Future<void> _fetchpatientData() async {
    QuerySnapshot doctorSnapshot =
        await FirebaseFirestore.instance.collection('Patients').get();
    for (final doc in doctorSnapshot.docs) {
      patientData[doc.id] = doc.data() as Map<String, dynamic>;
    }
  }

  Future<List<Widget>> _buildAppointmentCards() async {
    List<Widget> appointmentCards = [];
    QuerySnapshot appointmentsSnapshot = await FirebaseFirestore.instance
        .collection('Appointments')
        .where('doctorUid', isEqualTo: currentUserUid)
        .get();

    for (final doc in appointmentsSnapshot.docs) {
      Map<String, dynamic> appointmentData =
          doc.data() as Map<String, dynamic>;
      String appointmentID = doc.id;
      String patientUid = appointmentData['patientUid'];
      String date = appointmentData['date'].toString();
      String time = appointmentData['time'];
      String status = 'status'; // Assuming you have a 'status' field in Appointments

      if (patientData.containsKey(patientUid)) {
        Map<String, dynamic> patientDetails = patientData[patientUid]!;
        appointmentCards.add(
          PatientAppointmentCard(
            name: patientDetails['firstName'] + ' ' + patientDetails['lastName'],
            avatar: patientDetails['avatar'],
            appointmentDate: date,
            appointmentTime: time,
            status: status,
            patientUid: patientUid,
            doctorUid: currentUserUid,
            appointmentID: appointmentID,
          ),
        );
      }
    }
    return appointmentCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: FutureBuilder<List<Widget>>(
        future: _buildAppointmentCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Widget> appointmentCards = snapshot.data!;
            if (appointmentCards.isEmpty) {
              return const Center(child: Text('No appointments found'));
            } else {
              return ListView.builder(
                itemCount: appointmentCards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: appointmentCards[index],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
