import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naybeyes/main%20screens/full_screen_img.dart';

class DetailedAppointmentPage extends StatefulWidget {
  final String patientUid;
  final String doctorUid;
  final String appointmentId;

  const DetailedAppointmentPage({super.key, 
    required this.patientUid,
    required this.doctorUid,
    required this.appointmentId,
  });

  @override
  _DetailedAppointmentPageState createState() =>
      _DetailedAppointmentPageState();
}

class _DetailedAppointmentPageState extends State<DetailedAppointmentPage> {
  bool showPrescriptionFields = false;
  TextEditingController prescriptionController = TextEditingController();
  Map<String, dynamic>? patientDetails;

  @override
  void initState() {
    super.initState();
    // Fetch patient details based on patient UID
    fetchPatientDetails();
  }

  Future<void> fetchPatientDetails() async {
    try {
      // Fetch patient details from Firestore using the patient UID
      DocumentSnapshot patientSnapshot = await FirebaseFirestore.instance
          .collection('Patients')
          .doc(widget.patientUid)
          .get();
      if (patientSnapshot.exists) {
        setState(() {
          patientDetails = patientSnapshot.data() as Map<String, dynamic>;
        });
      }
    } catch (e) {
      print('Error fetching patient details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              if (patientDetails != null) ...[
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreenImage(
                                imageUrl: patientDetails!['avatar'] ?? ''),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: const Color(0xFF199A8E), width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(patientDetails!['avatar'] ?? ''),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${patientDetails!['firstName']} ${patientDetails!['lastName']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                                width:
                                    5), // Add some space between the icon and the text
                            Text(
                              patientDetails!['email'] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                                width:
                                    5), // Add some space between the icon and the text
                            Text(
                              patientDetails!['phoneNumber'] ?? '',
                              style: const TextStyle(
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
              ],
              const SizedBox(height: 16),
              // Personal Info Section
              if (patientDetails != null) ...[
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
                          color: Color(0xFF199A8E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      _buildPersonalInfoTile(
                          'Gender :', patientDetails!['gender'] ?? ''),
                      const Divider(),
                      _buildPersonalInfoTile(
                          'Blood Type :', patientDetails!['bloodType'] ?? ''),
                      const Divider(),
                      _buildPersonalInfoTile(
                          'Birthplace :', patientDetails!['birthplace'] ?? ''),
                      const Divider(),
                      _buildPersonalInfoTile(
                          'Height (cm) :', patientDetails!['height'] ?? ''),
                      const Divider(),
                      _buildPersonalInfoTile(
                          'Weight (kg) :', patientDetails!['weight'] ?? ''),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showPrescriptionFields = !showPrescriptionFields;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.fromLTRB(10, 15, 10, 15), // Adjusted padding
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF199A8E),
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
                  child: const Row(
                    // Changed to Row for horizontal layout
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center align the content horizontally
                    children: [
                      Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5), // Add spacing between icon and text
                      Text(
                        'Give prescription',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (showPrescriptionFields) ...[
                const SizedBox(height: 16),
                TextField(
                  controller: prescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Prescription',
                    alignLabelWithHint: true,
                    hintText: 'Write prescription here',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    savePrescription();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.fromLTRB(10, 15, 10, 15), // Adjusted padding
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF199A8E),
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
                    child: const Row(
                      // Changed to Row for horizontal layout
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center align the content horizontally
                      children: [
                        Icon(
                          Icons.save,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8), // Add spacing between icon and text
                        Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
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
              color: Color(0xFF199A8E),
              fontSize: 16,
            ),
          ),
          trailing: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> savePrescription() async {
    String prescription = prescriptionController.text.trim();
    if (prescription.isNotEmpty) {
      try {
        // Add prescription data as a document in the "Prescriptions" collection
        await FirebaseFirestore.instance.collection('Prescriptions').add({
          'patientUid': widget.patientUid,
          'doctorUid': widget.doctorUid,
          'appointmentId': widget.appointmentId,
          'prescription': prescription,
          // Add more fields as needed
        });

        // Show a snackbar to indicate successful prescription saving
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Prescription saved successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Clear prescription field after saving
        prescriptionController.clear();
      } catch (e) {
        // Handle any errors
        print('Error saving prescription: $e');
      }
    } else {
      // Show an error message if prescription field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter prescription before saving'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
