import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';

class AddNewPostPage extends StatefulWidget {
  @override
  _AddNewPostPageState createState() => _AddNewPostPageState();
}

class _AddNewPostPageState extends State<AddNewPostPage> {
  final TextEditingController _contentController = TextEditingController();
  List<XFile>? _imageFiles = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'),
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
                  controller: _contentController,
                  maxLines: 10,
                  validator: _validateTextField,
                  decoration: InputDecoration(
                    labelText: 'What do you want to say ?',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                  ),
                ),
                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    _selectImage();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Color(0xFF199A8E),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Upload image',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF199A8E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                _imageFiles != null && _imageFiles!.isNotEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Image',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF199A8E),
                      ),
                    ),
                    SizedBox(height: 10),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _imageFiles!.map((file) {
                        return Image.file(
                          File(file.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    ),
                  ],
                )
                    : SizedBox.shrink(),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    _submitForm();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF199A8E),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.post_add,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Post',
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

  // Validation Function
  String? _validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  Future<void> _selectImage() async {
    final imagePicker = ImagePicker();
    final List<XFile>? pickedFiles = await imagePicker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        _imageFiles = pickedFiles;
      });
    }
  }

  Future<List<String>> _uploadImages() async {
    List<String> imageUrls = [];
    try {
      for (XFile imageFile in _imageFiles!) {
        final firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('DoctorPosts')
            .child(DateTime.now().millisecondsSinceEpoch.toString() + '.jpg');
        await ref.putFile(File(imageFile.path));
        final imageUrl = await ref.getDownloadURL();
        imageUrls.add(imageUrl);
      }
      return imageUrls;
    } catch (e) {
      print('Error uploading images: $e');
      return [];
    }
  }

  Future<void> _saveRecordToFirestore(List<String> imageUrls) async {
    try {
      for (String imageUrl in imageUrls) {
        await FirebaseFirestore.instance.collection('DoctorPosts').add({
          'doctorUID': FirebaseAuth.instance.currentUser!.uid,
          'content': _contentController.text,
          'imageUrl': imageUrl,
          'date': DateFormat('MMMM dd, yyyy').format(DateTime.now()), // Date
          'time': DateTime.now().toIso8601String().substring(11, 16), // Time
        });
      }
    } catch (e) {
      print('Error saving record to Firestore: $e');
    }
  }

  Future<void> _submitForm() async {
    // Validate form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Upload images to Firebase Storage
    final imageUrls = await _uploadImages();

    // Save record to Firestore
    await _saveRecordToFirestore(imageUrls);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF199A8E),
        content: Text(
          'Posted successfully.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    // Clear form fields
    _contentController.clear();
    setState(() {
      _imageFiles = [];
    });
  }
}
