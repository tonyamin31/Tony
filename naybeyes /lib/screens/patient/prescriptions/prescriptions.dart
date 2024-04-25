import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naybeyes/screens/patient/prescriptions/prescription_card.dart';

class PatPrescriptionsPage extends StatefulWidget {
  const PatPrescriptionsPage({super.key});

  @override
  _PatPrescriptionsPageState createState() => _PatPrescriptionsPageState();
}

class _PatPrescriptionsPageState extends State<PatPrescriptionsPage> {
  late String currentUserUid;

  @override
  void initState() {
    super.initState();
    getCurrentUserUid();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescriptions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Prescriptions')
            .where('patientUid', isEqualTo: currentUserUid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No prescriptions found'));
          } else {
            // Display the prescriptions
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot prescription = snapshot.data!.docs[index];
                String doctorUid = prescription['doctorUid'];
                String appointmentId = prescription['appointmentId'];
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('Doctors')
                      .doc(doctorUid)
                      .get(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> doctorSnapshot) {
                    if (doctorSnapshot.connectionState ==
                            ConnectionState.waiting ||
                        !doctorSnapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else if (doctorSnapshot.hasError) {
                      return Text('Error: ${doctorSnapshot.error}');
                    } else {
                      var doctorData =
                          doctorSnapshot.data!.data() as Map<String, dynamic>;
                      return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Appointments')
                            .doc(appointmentId)
                            .get(),
                        builder: (context, AsyncSnapshot<DocumentSnapshot> appointmentSnapshot) {
                          if (appointmentSnapshot.connectionState ==
                                  ConnectionState.waiting ||
                              !appointmentSnapshot.hasData) {
                            return const CircularProgressIndicator();
                          } else if (appointmentSnapshot.hasError) {
                            return Text('Error: ${appointmentSnapshot.error}');
                          } else {
                            var appointmentData =
                                appointmentSnapshot.data!.data() as Map<String, dynamic>;
                            return PrescriptionCard(
                              doctorName: '${doctorData['firstName']} ${doctorData['lastName']}',
                              doctorAvatar: doctorData['avatar'],
                              appointmentDate: appointmentData['date'],
                              doctorPhone: doctorData['phoneNumber'],
                              doctorEmail: doctorData['email'],
                              doctorAddress: doctorData['address'],

                              prescription: prescription['prescription'],
                            );
                          }
                        },
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),


    );
  }
}

