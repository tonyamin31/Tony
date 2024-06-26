import 'package:flutter/material.dart';
import 'package:naybeyes/screens/patient/doctor%20public%20profile/doctor_public_profile.dart';

// appointment card on patient side 

class DocAppointmentCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String avatar;
  final String birthdate;
  final String gender;
  final String email;
  final String phoneNumber;
  final String specialization;
  final String address;

  final String appointmentDate;
  final String appointmentTime;
  final String status;
  final String patientUid;
  final String doctorUid;
  final String appointmentID;

  const DocAppointmentCard({super.key, 
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.birthdate,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.specialization,
    required this.address,

    required this.appointmentDate,
    required this.appointmentTime,
    required this.status,
    required this.patientUid,
    required this.doctorUid,
    required this.appointmentID,
  });

  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap: () {
        // Navigate to detailed appointment page with arguments
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
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF199A8E), width: 2),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatar),
              ),
            ),
            const SizedBox(width: 16),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. $firstName $lastName',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 19,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        appointmentDate,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
      
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        appointmentTime,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  
                  Row(
                    children: [
                      const Icon(
                        Icons.info,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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