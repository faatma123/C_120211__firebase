import 'package:flutter/material.dart';

class MyTextFild extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText; 
  final TextEditingController myController;
  const MyTextFild({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    required this.myController
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText:hintText,
        prefixIcon:  prefixIcon
      ),
    );
  }
}