import 'package:flutter/material.dart';
import 'package:myprescs/pages/prcs.dart';
//import 'second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: 
              viewbutton()
        ),
    
    );
  }
}
