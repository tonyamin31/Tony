import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final TextEditingController _medecineController = TextEditingController();
  final TextEditingController _additionalNoteController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController(); // New dosage controller

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () {
            Navigator.pop(context); // Navigate back when back arrow is clicked
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: _validateTextField,
                  controller: _medecineController,
                  decoration: InputDecoration(
                    labelText: 'Medicine name *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
                  ),
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: _dosageController, // Use dosage controller
                  keyboardType: TextInputType.number, // Set keyboard type to number
                  decoration: InputDecoration(
                    labelText: 'Dosage per day *', // Add dosage label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
                  ),
                ),
                const SizedBox(height: 10),
                
                TextFormField(
                  controller: _additionalNoteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Additional Note',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
                  ),
                ),
                const SizedBox(height: 10),
                
                GestureDetector(
                  onTap: () {
                    _saveMedicine();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Save medicine',
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
            ),
          ),
        ),
      ),
    );
  }

  String? _validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  Future<void> _saveRecordToFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('CustomMedicines').add({
        'patientUID': FirebaseAuth.instance.currentUser!.uid,
        'medicine': _medecineController.text,
        'description': _additionalNoteController.text,
        'dosage': int.tryParse(_dosageController.text) ?? 0, // Parse dosage as integer
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving record to Firestore: $e');
    }
  }
  Future<void> _saveMedicine() async {
    await _saveRecordToFirestore();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color(0xFF199A8E),
        content: Text(
          'Medicine added successfully.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    _medecineController.clear();
    _additionalNoteController.clear();
    _dosageController.clear();
    Navigator.pop(context);
  }
}
