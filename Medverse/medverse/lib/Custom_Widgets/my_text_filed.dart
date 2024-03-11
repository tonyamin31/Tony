import 'package:flutter/material.dart';

class MEDTextFormFiled extends StatefulWidget {
  var decoration;

  MEDTextFormFiled({
    required this.title,
    this.isPassword = false,
    this.validation,
    this.controller,
    this.decoration = const InputDecoration(),
    required String hintText,
  });
  final TextEditingController? controller;
  final String title;
  final bool isPassword;
  String? Function(String?)? validation;

  @override
  State<MEDTextFormFiled> createState() => _AMITTextFormFiledState();
}

class _AMITTextFormFiledState extends State<MEDTextFormFiled> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            obscureText: showPassword,
            decoration: InputDecoration(
              // Prefix icon with the title
              prefixIcon: Text(
                "${widget.title} ",
              ),
              suffixIcon: !widget.isPassword
                  ? null
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
              // Circular border with radius 10
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: widget.validation,
          ),
        ),
      ],
    );
  }
}
