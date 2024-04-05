import 'package:Asahby/Pages/Rules.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onMenuTap;

  const Header({
    required this.onMenuTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onMenuTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 251, 167, 42),
            ),
            child: const Center(
              child: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 51, 38, 117),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Rules(),
              ),
            );
          },
          child: Image.asset(
            'assets/images/LOGO.png',
            width: 80,
     
          ),
        ),
      ],
    );
  }
}
