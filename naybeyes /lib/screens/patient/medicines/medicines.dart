import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naybeyes/drop_down_lists/medicines.dart';
import 'package:naybeyes/screens/patient/medicines/add_custom_medicine.dart';
import 'package:naybeyes/screens/patient/medicines/medicine_expandable_card.dart';

class MedicinesPage extends StatefulWidget {
  @override
  _MedicinesPageState createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  String? _selectedMedicine;
  List<String> patientMedicines = [];

  @override
  void initState() {
    super.initState();
    // Fetch the list of medicines for the current patient
    fetchPatientMedicines();
  }

  // Function to fetch the list of medicines for the current patient from Firestore
  void fetchPatientMedicines() async {
    try {
      String currentUserId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> patientSnapshot =
          await FirebaseFirestore.instance.collection('Patients').doc(currentUserId).get();
      setState(() {
        patientMedicines = List<String>.from(patientSnapshot.data()?['medicines'] ?? []);
      });
    } catch (e) {
      print('Error fetching patient medicines: $e');
    }
  } 

  // Function to remove medicine from the medicines array
  void deleteMedicine(String medicineName) async {
    try {
      // Get the current user's ID
      String currentUserId = FirebaseAuth.instance.currentUser!.uid;
      
      // Reference to the current patient document in Firestore
      DocumentReference patientRef = FirebaseFirestore.instance.collection('Patients').doc(currentUserId);
      
      // Update the document by removing the selected medicine from the 'medicines' array field
      await patientRef.update({
        'medicines': FieldValue.arrayRemove([medicineName]),
      });

      // Refresh the list of medicines
      fetchPatientMedicines();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF199A8E),
          content: Text(
            'Medicine deleted successfully',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } catch (e) {
      // Print an error message if updating the document fails
      print('Error deleting medicine from patient document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to AddMedicinePage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicinePage()),
          );
        },
        label: Text(
          'Custom Medicine',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF199A8E),
      ),

      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0), // Adjust margins as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButtonFormField<String>(
                          value: _selectedMedicine,
                          items: medicines
                              .map((medicine) => DropdownMenuItem<String>(
                                    value: medicine['name'],
                                    child: Text(medicine['name']),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedMedicine = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Select Medicine',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      // Inside the onTap handler of GestureDetector
                      onTap: () async {
                        if (_selectedMedicine != null) {
                          try {
                            // Get the current user's ID
                            String currentUserId = FirebaseAuth.instance.currentUser!.uid;
                            
                            // Reference to the current patient document in Firestore
                            DocumentReference patientRef = FirebaseFirestore.instance.collection('Patients').doc(currentUserId);
                            
                            // Update the document by appending the selected medicine to the 'medicines' array field
                            await patientRef.update({
                              'medicines': FieldValue.arrayUnion([_selectedMedicine]),
                            });
                            fetchPatientMedicines(); // to refresh the page
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Color(0xFF199A8E),
                                content: Text(
                                  'Medicine added successfully',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );

                          } catch (e) {
                            // Print an error message if updating the document fails
                            print('Error adding medicine to patient document: $e');
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color.fromARGB(255, 51, 51, 51),
                              content: Text(
                                'No medicine selected',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                          // Clear the selected medicine
                        }
                      },

                    
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFF199A8E),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              for (String medicineName in patientMedicines)
                MedicineCard(
                  medicineName: medicineName,
                  // Fetch medicine details from the pre-made list based on medicine name
                  description: getMedicineDetails(medicineName)?['description'] ?? '',
                  dosage: getMedicineDetails(medicineName)?['dosage'] ?? '',
                  sideEffects: getMedicineDetails(medicineName)?['sideEffects']?.join(', ') ?? '',
                  onDelete: deleteMedicine,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic>? getMedicineDetails(String medicineName) {
    return medicines
        .firstWhere((medicine) => medicine['name'] == medicineName, orElse: () => <String, dynamic>{});
  }

}
