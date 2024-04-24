import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Appointment {
  final String doctorUid;
  final String patientUid;
  final DateTime date;
  final TimeOfDay time;

  Appointment({
    required this.doctorUid,
    required this.patientUid,
    required this.date,
    required this.time,
  });
}

class AppointmentBookingScreen extends StatefulWidget {
  final String doctorUid;

  AppointmentBookingScreen({required this.doctorUid});

  @override
  _AppointmentBookingScreenState createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> confirmAppointment(BuildContext context) async {
    String patientUid = FirebaseAuth.instance.currentUser!.uid; // fetch current user uid
    if (selectedDate != null && selectedTime != null) {
      try {
        Appointment appointment = Appointment(
          doctorUid: widget.doctorUid,
          patientUid: patientUid,
          date: selectedDate!,
          time: selectedTime!,
        );

        String timeString = appointment.time.format(context);
        String formattedDate =
            DateFormat('EEE, dd MMMM').format(appointment.date);

        // Add the appointment data as a document in the "Appointments" collection
        await FirebaseFirestore.instance.collection('Appointments').add({
          'doctorUid': appointment.doctorUid,
          'patientUid': appointment.patientUid,
          'date': formattedDate,
          'time': timeString,
        });

        // Show a snackbar to indicate successful booking
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Appointment booked successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Clear fields after successful booking
        setState(() {
          selectedDate = null;
          selectedTime = null;
        });

        // Navigate back to the previous screen
        Navigator.pop(context);
      } catch (e) {
        // Handle any errors
        print('Error booking appointment: $e');
      }
    } else {
      // Show an error message if date or time is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select date and time for the appointment'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Date Picker
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 3)),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text(selectedDate == null
                    ? 'Select Date'
                    : 'Date: ${selectedDate!.toString().split(' ')[0]}'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),

              // Time Picker
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null && pickedTime != selectedTime) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
                child: Text(selectedTime == null
                    ? 'Select Time'
                    : 'Time: ${selectedTime!.format(context)}'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),

              // Confirm Button
              ElevatedButton(
                onPressed: () {
                  confirmAppointment(context);
                },
                child: Text('Confirm Appointment'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
