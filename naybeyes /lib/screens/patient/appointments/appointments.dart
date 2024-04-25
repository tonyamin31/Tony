import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naybeyes/screens/patient/appointments/doc_appointment_card.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late String currentUserUid;
  Map<String, Map<String, dynamic>> doctorData = {}; // Map to store doctor data
  late Future<void> _doctorDataFuture;

  @override
  void initState() {
    super.initState();
    getCurrentUserUid();
    _doctorDataFuture = _fetchDoctorData();
  }

  Future<void> getCurrentUserUid() async {
    // Get the current user's UID from FirebaseAuth
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserUid = user.uid;
      });
    }
  }

  Future<void> _fetchDoctorData() async {
    // Get all doctors from Firestore
    QuerySnapshot doctorSnapshot = await FirebaseFirestore.instance.collection('Doctors').get();
    for (final doc in doctorSnapshot.docs) {
      doctorData[doc.id] = doc.data() as Map<String, dynamic>;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: _doctorDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show an error message if there's an error with fetching doctor data
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Doctor data has been fetched, now build the appointments list
            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Appointments')
                  .where('patientUid', isEqualTo: currentUserUid) // Filter appointments where patientUid matches current user's UID
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for data
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Show an error message if there's an error with the stream
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Widget> appointmentCards = [];
                  for (final doc in snapshot.data!.docs) {
                    Map<String, dynamic> appointmentData = doc.data() as Map<String, dynamic>;
                    String appointmentID = doc.id;
                    String doctorUid = appointmentData['doctorUid'];
                    String date = appointmentData['date'].toString(); // Convert Firestore Timestamp to DateTime
                    String time = appointmentData['time'];
                    String status = 'status'; // Assuming you have a 'status' field in Appointments

                    if (doctorData.containsKey(doctorUid)) {
                      Map<String, dynamic> doctorDetails = doctorData[doctorUid]!;
                      appointmentCards.add(
                        DocAppointmentCard(
                          firstName: doctorDetails['firstName'],
                          lastName: doctorDetails['lastName'],
                          avatar: doctorDetails['avatar'],
                          specialization: doctorDetails['specialization'],
                          address: doctorDetails['address'],
                          phoneNumber: doctorDetails['phoneNumber'],
                          email: doctorDetails['email'],
                          gender: doctorDetails['gender'],
                          birthdate: doctorDetails['birthdate'],
                          appointmentDate: date,
                          appointmentTime: time,
                          status: status,
                          patientUid: appointmentData['patientUid'],
                          doctorUid: appointmentData['doctorUid'],
                          appointmentID: appointmentID,
                        ),
                      );
                    }
                  }

                  if (appointmentCards.isEmpty) {
                    return const Center(child: Text('No appointments found'));
                  } else {
                    return ListView.builder(
                      itemCount: appointmentCards.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(12,0,12,0),
                          child: appointmentCards[index],
                        );
                      },
                    );
                  }
                }
              },
            );
          }
        },
      ),
    );
  }
}
