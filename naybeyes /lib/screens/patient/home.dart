// Packages imported
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Import UserProvider and Provider package
import 'package:naybeyes/user_provider.dart';
import 'package:provider/provider.dart';

// Widgets imported
import 'package:naybeyes/widgets/top_doctor_card.dart';
import 'package:naybeyes/screens/patient/appointments/doc_appointment_card.dart';
import 'package:naybeyes/widgets/pill_reminder.dart';


class PatientHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final userData = userProvider.userData;
          final userUid = userProvider.user!.uid;
          if (userData != null) {

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
                    'lib/assets/logo_varients/fulllogo-green.png', 
                    width: 150, // Adjust the width of the image as needed
                    height: 80, // Adjust the height of the image as needed
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/patient/profile');
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
                            'Hey, ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            userData['firstName'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF199A8E),
                            ),
                          ),
                          Text(
                            'How\'s your health today ?',
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

              FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('Appointments')
                    .where('patientUid', isEqualTo: userUid)
                    .orderBy('date', descending: false) // 'date' field for sorting
                    .limit(2) // Limiting to 2 upcoming appointments
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final appointments = snapshot.data!.docs;

                    // Check if there are no appointments
                    bool hasAppointments = appointments.isNotEmpty;

                    return Visibility(
                      visible: hasAppointments, // Show the container if there are appointments
                      child: Column(
                        children: [
                          // Container for "Upcoming Appointments" and appointment widgets
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
                                    Navigator.pushNamed(context, '/patient/appointments');
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
                                // Display appointment widgets if there are appointments
                                if (hasAppointments)
                                  Column(
                                    children: appointments.map((appointment) {
                                      final appointmentData = appointment.data() as Map<String, dynamic>;
                                      final doctorUid = appointmentData['doctorUid'];
                                      return FutureBuilder<DocumentSnapshot>(
                                        future: FirebaseFirestore.instance.collection('Doctors').doc(doctorUid).get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Text('Error: ${snapshot.error}');
                                          } else {
                                            final doctorData = snapshot.data!.data() as Map<String, dynamic>;
                                            return DocAppointmentCard(
                                              firstName: doctorData['firstName'],
                                              lastName: doctorData['lastName'],
                                              avatar: doctorData['avatar'],
                                              specialization: doctorData['specialization'],
                                              address: doctorData['address'],
                                              email: doctorData['email'],
                                              phoneNumber: doctorData['phoneNumber'],
                                              gender: doctorData['gender'],
                                              birthdate: doctorData['birthdate'],
                                              appointmentDate: appointmentData['date'],
                                              appointmentTime: appointmentData['time'],
                                              status: 'status', // Assuming you have a 'status' field in Appointments
                                              patientUid: appointmentData['patientUid'],
                                              doctorUid: appointmentData['doctorUid'],
                                              appointmentID: appointment.id,
                                            );
                                          }
                                        },
                                      );
                                    }).toList(),
                                  ),
                              ],
                            ),
                          ),
                          // Add other widgets here if needed
                        ],
                      ),
                    );
                  }
                },
              ),


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
                              Navigator.pushNamed(context, '/patient/medicines');
                            },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Medicines',
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

                    PillReminderCard(
                      medicineName: 'Tramadol',
                      time: '4:30 pm',
                      isTaken: false,
                      onCheckboxChanged: (bool? value) {
                        // Handle checkbox change here
                      },
                    ),

                    // Add more PillReminderCard widgets as needed
                  ],
                ),
              ),
              SizedBox(height: 12),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the search page
                    Navigator.pushNamed(context, '/patient/search');
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
                                  hintText: 'Find a doctor',
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

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0), // Add padding around the grid
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Make the ListView scroll horizontally
                  child: Row(
                    children: [
                      _buildSquareButton(context, Icons.folder, 'Records'),
                      SizedBox(width: 15),
                      _buildSquareButton(context, Icons.description, 'Prescriptions'),
                      SizedBox(width: 15),
                      _buildSquareButton(context, Icons.calendar_today, 'Appointments'),
                      SizedBox(width: 15),
                      _buildSquareButton(context, Icons.medical_services, 'Medicines'),
                      SizedBox(width: 15),
                      _buildSquareButton(context, Icons.local_hospital, 'Ambulance'),
                      SizedBox(width: 15),
                      _buildSquareButton(context, Icons.pin_drop, 'Finder'),
                    ],
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0), // Add padding around the grid
              //   child: GridView.count(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     crossAxisCount: 3,
              //     mainAxisSpacing: 12, // Spacing between rows
              //     crossAxisSpacing: 12, // Spacing between columns
              //     children: [
              //       _buildSquareButton(context, Icons.medical_services, 'Medicines'),
              //       _buildSquareButton(context, Icons.description, 'Prescriptions'),
              //       _buildSquareButton(context, Icons.calendar_today, 'Appointments'),
              //       _buildSquareButton(context, Icons.folder, 'Records'),
              //       _buildSquareButton(context, Icons.local_hospital, 'Ambulance'),
              //       _buildSquareButton(context, Icons.pin_drop, 'Finder'),
              //     ],
              //   ),
              // ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                    Text(
                      'Top Doctors',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF199A8E),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // TopDoctorCard widgets go here
                          TopDoctorCard(
                            name: 'Wael Ghoniem',
                            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/medverse-my.appspot.com/o/doctor%20avatar%2F1711419787419?alt=media&token=670c92cb-a858-45cd-bd79-c8138af299a3',
                            specialization: 'Cardiologist',
                            address: 'Cairo, Egypt',
                          ),
                          TopDoctorCard(
                            name: 'Wael Ghoniem',
                            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/medverse-my.appspot.com/o/doctor%20avatar%2F1711419787419?alt=media&token=670c92cb-a858-45cd-bd79-c8138af299a3',
                            specialization: 'Cardiologist',
                            address: 'Cairo, Egypt',
                          ),
                          TopDoctorCard(
                            name: 'Wael Ghoniem',
                            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/medverse-my.appspot.com/o/doctor%20avatar%2F1711419787419?alt=media&token=670c92cb-a858-45cd-bd79-c8138af299a3',
                            specialization: 'Cardiologist',
                            address: 'Cairo, Egypt',
                          ),
                          // Add more DoctorCard widgets as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
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
  return SizedBox(
    width: 115, // Set the desired width
    height: 115, // Set the desired height
    child: GestureDetector(
      onTap: () {
        if (text == 'Medicines') {
          Navigator.pushNamed(context, '/patient/medicines');
        } else if (text == 'Prescriptions') {
          Navigator.pushNamed(context, '/patient/prescriptions');
        }
        else if (text == 'Appointments') {
          Navigator.pushNamed(context, '/patient/appointments');
        }
        else if (text == 'Records') {
          Navigator.pushNamed(context, '/patient/records');
        }
        else if (text == 'Ambulance') {
          Navigator.pushNamed(context, '/patient/ambulance');
        }
        else if (text == 'Profile Copy') {
          Navigator.pushNamed(context, '/patient/profile_copy');
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
    ),
  );
}

}

