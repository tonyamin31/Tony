import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider extends ChangeNotifier {
  late User? _user;
  String? _userRole; // store the user role
  Map<String, dynamic>? _userData; // Store user data fetched from Firestore

  User? get user => _user;
  String? get userRole => _userRole; // Getter for userRole
  Map<String, dynamic>? get userData => _userData; // Getter for userData

  void setUser(User? user, String role) { // Modified setUser method
    _user = user;
    _userRole = role; // Assign the user role
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    if (_user != null) {
      String collection = _userRole == 'doctor' ? 'Doctors' : 'Patients';
      // Fetch user data from Firestore based on userRole
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(collection).doc(_user!.uid).get();
      _userData = snapshot.data() as Map<String, dynamic>?; // Store fetched user data
      notifyListeners();
    }
  }
}
