// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:medverse/HomePage.dart';
import 'package:medverse/login_as.dart';
import 'package:medverse/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home page',
      initialRoute: '/home',
      routes: {'/home': (context) => login_as()},
    );
  }
}
