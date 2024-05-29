// Packages imported
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:naybeyes/firebase_options.dart';

// user provider
import 'package:naybeyes/user_provider.dart';
import 'package:provider/provider.dart';

// Page
import 'package:naybeyes/main%20screens/role_selection.dart';
import 'package:naybeyes/main%20screens/forget_password.dart';
import 'package:naybeyes/main%20screens/splash_screen.dart';

// Patient Pages imported
import 'package:naybeyes/screens/patient/home.dart';
import 'package:naybeyes/screens/patient/profile.dart';
import 'package:naybeyes/screens/patient/medicines/medicines.dart';
import 'package:naybeyes/screens/patient/appointments/appointments.dart';
import 'package:naybeyes/screens/patient/records/all_records.dart';
import 'package:naybeyes/screens/patient/ambulance.dart';
import 'package:naybeyes/screens/patient/search/search.dart';
import 'package:naybeyes/screens/patient/prescriptions/prescriptions.dart';
import 'package:naybeyes/screens/patient/finder.dart';

// P Authentication
import 'package:naybeyes/screens/patient/authentication pages/login.dart';
import 'package:naybeyes/screens/patient/authentication pages/signup.dart';

// Doctor Pages imported
import 'package:naybeyes/screens/doctor/home.dart';
import 'package:naybeyes/screens/doctor/profile/profile.dart';
import 'package:naybeyes/screens/doctor/appointments/schedule.dart';
import 'package:naybeyes/screens/doctor/prescriptions/prescriptions.dart';
import 'package:naybeyes/screens/doctor/patients/my_patients.dart';
// D Authentication
import 'package:naybeyes/screens/doctor/authentication pages/login.dart';
import 'package:naybeyes/screens/doctor/authentication pages/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        // Add Other providers
      ],
      child: const MedVerse(),
    ),
  );
}

class MedVerse extends StatelessWidget {
  const MedVerse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
            primary:
                const Color(0xFF199A8E)), // focus border color of the TextField
      ),
      title: 'MedVerse',
      initialRoute: '/splashscreen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splashscreen': (context) => const SplashScreen(),
        '/roleselection': (context) => const RoleSelectionPage(),
        '/forgetpassword': (context) => ForgetPasswordPage(),

        // Patient Side routes
        '/patient/home': (context) => const PatientHomePage(),
        '/patient/appointments': (context) => const AppointmentsPage(),
        '/patient/medicines': (context) => const MedicinesPage(),
        '/patient/profile': (context) => const PatientProfilePage(),
        '/patient/ambulance': (context) => const AmbulancePage(),
        '/patient/finder': (context) => const FinderPage(),
        '/patient/prescriptions': (context) => const PatPrescriptionsPage(),
        '/patient/records': (context) => const RecordsPage(),
        '/patient/search': (context) => const SearchPage(),

        '/patient/login': (context) => const PatientLoginPage(),
        '/patient/signup': (context) => const PatientSignUpPage(),

        // Doctor Side Routes
        // '/test': (context) => ImageBoxWithName(),
        '/doctor/home': (context) => const DoctorHomePage(),
        '/doctor/profile': (context) => const DoctorProfilePage(),
        '/doctor/schedule': (context) => const SchedulePage(),
        '/doctor/prescriptions': (context) => const DocPrescriptionsPage(),
        '/doctor/patients': (context) => const MyPatientsPage(),
        '/doctor/login': (context) => const DoctorLoginPage(),
        '/doctor/signup': (context) => const DoctorSignUpPage(),
      },
    );
  }
}
