import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naybeyes/screens/doctor/patients/patient_card_insearch.dart';

class MyPatientsPage extends StatefulWidget {
  const MyPatientsPage({super.key});

  @override
  _MyPatientsPageState createState() => _MyPatientsPageState();
}

class _MyPatientsPageState extends State<MyPatientsPage> {
  List<DocumentSnapshot> doctors = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchDoctors(); // Fetch doctors when the page is initialized
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> fetchDoctors({String? searchQuery}) async {
  try {
    // Get the current doctor's UID
    String doctorUid = FirebaseAuth.instance.currentUser!.uid;

    // Query appointments where the doctorUid matches
    QuerySnapshot appointmentSnapshot = await FirebaseFirestore.instance
        .collection('Appointments')
        .where('doctorUid', isEqualTo: doctorUid)
        .get();

    // Extract patient UIDs from the appointments
    List<String> patientUids = appointmentSnapshot.docs
        .map((appointment) => appointment['patientUid'] as String)
        .toList();

    // Query patients where the UID is in the list of patientUids
    Query query = FirebaseFirestore.instance.collection('Patients');

    if (searchQuery != null && searchQuery.isNotEmpty) {
      // Convert search query to lowercase and remove leading/trailing whitespaces
      String formattedQuery = searchQuery.trim().toLowerCase();

      QuerySnapshot querySnapshot = await query.get();

      List<DocumentSnapshot> filteredPatients = querySnapshot.docs
          .where((doc) =>
              patientUids.contains(doc.id) &&
              doc['firstName'].toLowerCase().contains(formattedQuery))
          .toList();

      setState(() {
        doctors = filteredPatients;
      });
    } else {
      // If search query is empty or null, fetch all doctors
      QuerySnapshot querySnapshot = await query.get();
      List<DocumentSnapshot> filteredPatients = querySnapshot.docs
          .where((doc) => patientUids.contains(doc.id))
          .toList();

      setState(() {
        doctors = filteredPatients;
      });
    }
  } catch (e) {
    print('Error fetching patients: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Icon(Icons.search), // Add search icon
                    const SizedBox(width: 15), // Add some space between icon and text
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          // Call fetchDoctors whenever the text changes
                          fetchDoctors(searchQuery: value.trim());
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search for a patient',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                var patientData = doctors[index].data();
                if (patientData != null && patientData is Map<String, dynamic>) {
                  String firstName = patientData['firstName'] ?? 'Unknown'; // Accessing 'firstName' field
                  String middletName = patientData['middleName'] ?? 'Unknown'; // Accessing 'middleName' field
                  String lastName = patientData['lastName'] ?? 'Unknown'; // Accessing 'lastName' field
                  String fullName = '$firstName $middletName $lastName'; // Combined name
                  String avatar = patientData['avatar'] ?? 'Unknown'; // Accessing 'avatar' field
                  String email = patientData['email'] ?? 'Unknown'; // Accessing 'avatar' field
                  String phone = patientData['phoneNumber'] ?? 'Unknown'; // Accessing 'avatar' field
                  String gender = patientData['gender'] ?? 'Unknown'; // Accessing 'avatar' field
                  String birthdate = patientData['birthdate'] ?? 'Unknown'; // Accessing 'birthdate' field
                  return PatientCardSearch(
                    name: fullName,
                    avatar: avatar,
                    birthdate: birthdate,
                    email: email,
                    phone: phone,
                    gender: gender,
                  );
                } else {
                  // Handle case where patientData is null or not a Map<String, dynamic>
                  return const ListTile(
                    title: Text('Unknown'),
                    subtitle: Text('Unknown'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
