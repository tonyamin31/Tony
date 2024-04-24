import 'package:flutter/material.dart';

// Doc Profile
import 'package:naybeyes/screens/doctor/profile/profile.dart';

// doctor card on top doctors slider

class TopDoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String address;
  final String imageUrl;

  TopDoctorCard({
    required this.name,
    required this.specialization,
    required this.address,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the doctor's profile page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorProfilePage()),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
          ]
        ),
        padding: EdgeInsets.all(12),
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
                        color: Color(0xFF199A8E), // Border color
                        width: 1, // Border width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50, // Adjust the size of the profile picture as needed
                      backgroundImage: NetworkImage(imageUrl), // Provide the path to the profile picture image asset
                    ),
                  ),
                  
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dr. $name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        specialization,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        address,
                        style: TextStyle(
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
