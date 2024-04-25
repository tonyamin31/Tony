import 'package:flutter/material.dart';
import 'package:naybeyes/screens/patient/doctor%20public%20profile/doctor_public_profile.dart';

class DoctorCardSearch extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String address;
  final String specialization;
  final String residence;
  final String avatar;
  final String birthdate;
  final String gender;
  final String email;
  final String phoneNumber;
  final String doctorUid;

  const DoctorCardSearch({super.key, 
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.specialization,
    required this.residence,
    required this.avatar,
    required this.birthdate,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.doctorUid,
  });

  int _calculateAge(String birthdate) {
    DateTime today = DateTime.now();
    DateTime birthDate = DateTime.parse(birthdate);
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    int age = _calculateAge(birthdate);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PublicDoctorProfilePage(
              doctorUid: doctorUid,
            ),
          ),
        );
      },
      
      child: Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.fromLTRB(12 , 6, 12, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Color(0xFF199A8E), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF199A8E), // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50, // Adjust the size of the profile picture as needed
                    backgroundImage: NetworkImage(avatar), // Provide the path to the profile picture image asset
                  ),
                ),
                
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dr. $firstName $lastName',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      residence,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Age: $age',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
