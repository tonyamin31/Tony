import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:naybeyes/main%20screens/full_screen_img.dart';
import 'package:naybeyes/widgets/profile_tile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Import UserProvider and Provider package
import 'package:naybeyes/user_provider.dart';
import 'package:provider/provider.dart';

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage({super.key});

  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      // Navigate to the login page after sign-out
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/patient/login',
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final userData = userProvider.userData;

          if (userData != null) {
            final avatar = userData['avatar'] ?? '';
            final firstName = userData['firstName'] ?? '';
            final middleName = userData['middleName'] ?? '';
            final lastName = userData['lastName'] ?? '';
            final fullName = '$firstName $middleName $lastName'; // Concatenating first name and last name
            final email = userData['email'] ?? '';
            final phone = userData['phoneNumber'] ?? '';


            int calculateAge(String birthdate) {
              DateTime today = DateTime.now();
              DateTime birthDate = DateTime.parse(birthdate);
              int age = today.year - birthDate.year;
              if (today.month < birthDate.month ||
                  (today.month == birthDate.month && today.day < birthDate.day)) {
                age--;
              }
              return age;
            }


            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity, // Make the container stretch to full width
                    margin: const EdgeInsets.symmetric(horizontal: 10), // Set horizontal margins
                    decoration: BoxDecoration(
                      color: const Color(0xFF199A8E), // Background color
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ], // Rounded corners
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2), // White border
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage(imageUrl: avatar),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(avatar),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),


                        Text(
                          fullName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 5), // Add some space between the icon and the text
                            Text(
                              '$email',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 5), // Add some space between the icon and the text
                            Text(
                              '$phone',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Personal Info Section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Info',
                          style: TextStyle(
                            fontSize: 18.0,
                            color:Color(0xFF199A8E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        _buildPersonalInfoTile('Gender :', userData['gender']),
                        const Divider(),
                        _buildPersonalInfoTile('Blood Type :', userData['bloodType']),
                        const Divider(),
                        _buildPersonalInfoTile('Birthplace :', userData['birthplace']),
                        const Divider(),
                        _buildPersonalInfoTile('Height (cm) :', userData['height']),
                        const Divider(),
                        _buildPersonalInfoTile('Weight (kg) :', userData['weight']),
                      ],
                    ),
                  ),

                  // Container wraping all the expansion tiles
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        ExpandableTile(
                          title: 'Allergies',
                          children: [
                            // for (var allergy in allergies) // Assuming 'allergies' is a list of allergy items
                            //   ListTile(
                            //     title: Text(allergy),
                            //   ),
                          ],
                        ),
                        Divider(),
                        ExpandableTile(
                          title: 'Chronic Diseases',
                          children: [
                            // for (var disease in chronicDiseases) // Assuming 'chronicDiseases' is a list of chronic disease items
                            //   ListTile(
                            //     title: Text(disease),
                            //   ),
                          ],
                        ),
                        // Add more ExpandableTile widgets for other sections
                        Divider(),
                        ExpandableTile(
                          title: 'test look',
                          children: [
                            ListTile(title: Text('Tile 1')),
                            ListTile(title: Text('Tile 2')),
                            ListTile(title: Text('Tile 3')),
                            ListTile(title: Text('Tile 4')),
                            ListTile(title: Text('Tile 5')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () => _signOut(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15), // Remove default padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Set button's border radius
                      ),
                    ),
                    child: const SizedBox(
                      width: 150, // Set desired width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.exit_to_app, // Use the sign-out icon
                            color: Color(0xFF199A8E),
                          ),
                          SizedBox(width: 5), // Add some space between the icon and the text
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  // widget for the titles in the personal info section
  Widget _buildPersonalInfoTile(String title, String value) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color:Color(0xFF199A8E),
              fontSize: 16,
            ),
          ),
          trailing: Text(value,
            style: const TextStyle(
            fontSize: 16,
            ),),
        ),
      ],
    );
  }
}
