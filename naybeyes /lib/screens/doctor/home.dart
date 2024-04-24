// Packages imported
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import UserProvider and Provider package
import 'package:naybeyes/user_provider.dart';
import 'package:naybeyes/screens/doctor/appointments/patient_appointment_card.dart';
import 'package:provider/provider.dart';

// Widgets imported
// import 'package:naybeyes/widgets/horizontal_doctor_card.dart';

class DoctorHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final userData = userProvider.userData;
          final userUid = userProvider.user!.uid;
          if (userData != null) {
          final firstName = userData['firstName'] ?? '';

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // top margin
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/assets/logo_varients/logo-green.png', 
                      width: 150, // Adjust the width of the image as needed
                      height: 80, // Adjust the height of the image as needed
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/doctor/profile');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF199A8E), // Border color
                                width: 1, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 35, // Adjust the size of the profile picture as needed
                              backgroundImage: NetworkImage(userData['avatar']), // Provide the path to the profile picture image asset
                            ),
                          ),
                        ),
                        SizedBox(width: 15), // Add some spacing between the profile picture and the text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back , ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Dr. $firstName',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF199A8E),
                              ),
                            ),
                            Text(
                              'We wish you a nice day.',
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
              ),
              
              SizedBox(height: 25),
              
              

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the search page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PatientsSearchPage(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                            child: IgnorePointer(
                              child: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0), // Add padding around the grid
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 12, // Spacing between rows
                  crossAxisSpacing: 12, // Spacing between columns
                  children: [
                    _buildSquareButton(context, Icons.description, 'Prescriptions'),
                    _buildSquareButton(context, Icons.schedule, 'Schedule'),
                    _buildSquareButton(context, Icons.person, 'Patients'),
                    
                  ],
                ),
              ),
              SizedBox(height: 25),

              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
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
                    GestureDetector(
                      onTap: () {
                              // Navigate to the appointments page
                              Navigator.pushNamed(context, '/doctor/schedule');
                            },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Upcoming Appointments',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF199A8E),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_right,
                            color: Color(0xFF199A8E), // Green color
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    
                    
                    // implement the logic here
                    // Display upcoming appointments using FutureBuilder
                    FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('Appointments')
                          .where('doctorUid', isEqualTo: userUid)
                          .orderBy('date', descending: false) // Assuming 'date' field for sorting
                          .limit(2) // Limiting to 2 upcoming appointments
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<Widget> appointmentWidgets = [];
                          final appointments = snapshot.data!.docs;

                          // Fetch patient data for all appointments simultaneously
                          final List<Future<Map<String, dynamic>?>> patientDataFutures = appointments.map((appointment) async {
                            final appointmentData = appointment.data() as Map<String, dynamic>;
                            final patientUid = appointmentData['patientUid'];
                            final patientSnapshot = await FirebaseFirestore.instance.collection('Patients').doc(patientUid).get();
                            return patientSnapshot.exists ? patientSnapshot.data() as Map<String, dynamic> : null;
                          }).toList();

                          // Wait for all patient data to be fetched
                          return FutureBuilder<List<Map<String, dynamic>?>>(
                            future: Future.wait(patientDataFutures),
                            builder: (context, patientSnapshot) {
                              if (patientSnapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (patientSnapshot.hasError) {
                                return Text('Error: ${patientSnapshot.error}');
                              } else {
                                // Build PatientAppointmentCard widgets once all data is fetched
                                final patientDataList = patientSnapshot.data!;
                                for (int i = 0; i < appointments.length; i++) {
                                  final appointmentData = appointments[i].data() as Map<String, dynamic>;
                                  final patientData = patientDataList[i];
                                  if (patientData != null) {
                                    appointmentWidgets.add(
                                      PatientAppointmentCard(
                                        name: patientData['firstName'] + ' ' + patientData['lastName'],
                                        avatar: patientData['avatar'],
                                        appointmentDate: appointmentData['date'],
                                        appointmentTime: appointmentData['time'],
                                        status: 'status', // Assuming you have a 'status' field in Appointments
                                        patientUid: appointmentData['patientUid'],
                                        doctorUid: appointmentData['doctorUid'],
                                        appointmentID: appointments[i].id,
                                      ),
                                    );
                                  }
                                }
                                return Column(
                                  children: appointmentWidgets,
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        );
        
        } else {
        return CircularProgressIndicator();
        }
        }, //builder
      ),
    );
  }

 // Method to build a square button with icon
  Widget _buildSquareButton(BuildContext context, IconData iconData, String text) {
    return GestureDetector(
      onTap: () {

        if (text == 'Patients') {
          Navigator.pushNamed(context, '/doctor/patients');
        } else if (text == 'Prescriptions') {
          Navigator.pushNamed(context, '/doctor/prescriptions');
        }
        else if (text == 'Schedule') {
          Navigator.pushNamed(context, '/doctor/schedule');
        }
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF199A8E), // Button color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 36,
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Define getCurrentUserId function
  // void getCurrentUserId() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String userId = user.uid;
  //     // Print or use userId as needed
  //     print(userId);
  //   } 
  // }
}

