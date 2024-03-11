import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medverse/login/login.dart';
import '../Custom_Widgets/buttons.dart';

class login_as extends StatelessWidget {
  const login_as({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(children: [
              const SizedBox(height: 100),
              const SizedBox(
                height: 180,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/LOGO.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              CustomButton(
                text: 'Login as doctor',
                color: const Color.fromARGB(255, 25, 154, 142),
                //icon: const IconData(0xe802, fontFamily: ''),
                onPressed: (() {}),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Login as patient',
                color: const Color(0XFF199A8E),
                //icon: const IconData(0xe802, fontFamily: ''),
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                }),
              ),
            ]),
          ),
        ),
        // other children widgets of Stack
      ],
    );
  }
}
