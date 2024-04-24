import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naybeyes/screens/patient/search/doctor_card_insearch.dart';

class FindDoctorPage extends StatefulWidget {
  @override
  _FindDoctorPageState createState() => _FindDoctorPageState();
}

class _FindDoctorPageState extends State<FindDoctorPage> {
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
      Query query = FirebaseFirestore.instance.collection('Doctors');

      if (searchQuery != null && searchQuery.isNotEmpty) {
        // Convert search query to lowercase and remove leading/trailing whitespaces
        String formattedQuery = searchQuery.trim().toLowerCase();
        
        QuerySnapshot querySnapshot = await query.get();

        List<DocumentSnapshot> filteredDoctors = querySnapshot.docs
          .where((doc) => doc['firstName'].toLowerCase().contains(formattedQuery))
          .toList();

        setState(() {
          doctors = filteredDoctors;
        });
      } else {
        // If search query is empty or null, fetch all doctors
        QuerySnapshot querySnapshot = await query.get();
        setState(() {
          doctors = querySnapshot.docs;
        });
      }
    } catch (e) {
      print('Error fetching doctors: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
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
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.search), // Add search icon
                    SizedBox(width: 15), // Add some space between icon and text
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          // Call fetchDoctors whenever the text changes
                          fetchDoctors(searchQuery: value.trim());
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for a doctor',
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
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                var doctorData = doctors[index].data();
                if (doctorData != null && doctorData is Map<String, dynamic>) {
                  String firstName = doctorData['firstName'] ?? 'Unknown'; // Accessing 'firstName' field
                  String lastName = doctorData['lastName'] ?? 'Unknown'; // Accessing 'lastName' field
                  String gender= doctorData['gender'] ?? 'Unknown'; // Combined name
                  String avatar = doctorData['avatar'] ?? 'Unknown'; // Accessing 'avatar' field
                  String specialization = doctorData['specialization'] ?? 'Unknown'; // Accessing 'avatar' field
                  String birthdate = doctorData['birthdate'] ?? 'Unknown'; // Accessing 'birthdate' field
                  String address = doctorData['address'] ?? 'Unknown'; // Accessing 'address' field
                  String residence = doctorData['residence'] ?? 'Unknown'; // Accessing 'address' field
                  String email = doctorData['email'] ?? 'Unknown'; // Accessing 'address' field
                  String phoneNumber = doctorData['phoneNumber'] ?? 'Unknown'; // Accessing 'address' field
                  String doctorUid = doctors[index].id;
                  return DoctorCardSearch(
                    firstName: firstName,
                    lastName: lastName,
                    avatar: avatar,
                    gender: gender,
                    specialization:specialization,
                    address: address,
                    email: email,
                    phoneNumber: phoneNumber,
                    birthdate: birthdate,
                    residence: residence,
                    doctorUid: doctorUid,
                  );
                } else {
                  // Handle case where doctorData is null or not a Map<String, dynamic>
                  return ListTile(
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
