import 'package:flutter/material.dart';

class PatientCardSearch extends StatelessWidget {
  final String name;
  final String avatar;
  final String birthdate;
  final String email;
  final String phone;
  final String gender;

  const PatientCardSearch({super.key, 
    required this.name,
    required this.avatar,
    required this.birthdate,
    required this.email,
    required this.phone,
    required this.gender,
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
        // Navigate to the doctor's profile page
        // Navigator.pushNamed(context, '/doctor/profile');
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF199A8E),
                      width: 1,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(avatar),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis, // Add this line
                        ),
                        maxLines: 1, // Add this line
                        overflow: TextOverflow.ellipsis, // Add this line
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            phone,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Age: $age',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            gender,
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
          ],
        ),
      ),
    );
  }
}
