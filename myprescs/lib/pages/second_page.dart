import 'package:flutter/material.dart';
import 'package:myprescs/widgets/clickable.dart';
import 'package:myprescs/widgets/presc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 66.0, right: 30, left: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Divider(
                thickness: 2,
              ),
              const Row(children: [
                Icon(Icons.arrow_right),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Hamdy',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Text('Dentist'),
                    ],
                  ),
                ) // Doctor Information
                ,
              ]),
              // Prescription Section
              const Divider(
                thickness: 2,
              ),
              presc(),
              //DATABASE
              Padding(
                padding: EdgeInsets.all(30),
                child: Clickabledata(
                  dosageText: Texxt(
                      'Take 1 tablet by mouth after dinner for 2 weeks .\nIf needed, take one more after 2 hours.'),
                  sideEffectsText: Texxt(
                      'Can cause stomach pain, nausea, diarrhea, loss of apetite ,cloudy urine, increased sweating and red spots on the skin.'),
                ),
              ),
              SizedBox(height: 30),
              Text('Prescribed by:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(' Dr.Hamdy'),
            ])));
  }
}

// ElevatedButton.icon(
//   onPressed: () {
//     Navigator.of(context).pop();
//   },
//   icon: Icon(Icons.arrow_back),
//   label: Text('Back'),
// ),

// ElevatedButton(
//           onPressed: () {
//             // Navigate to SecondPage when the button is pressed
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SecondPage()),