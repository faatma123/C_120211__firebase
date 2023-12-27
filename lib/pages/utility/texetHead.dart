

import 'package:flutter/material.dart';

class TextHead extends StatelessWidget {
  final String headerText;
  final double fontSize;
  final bool isFontWeight;
  const TextHead({
    super.key,
    required this.headerText,
    this.fontSize = 30,
    this.isFontWeight = false
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: 
        isFontWeight ? FontWeight.bold:FontWeight.w400
      ),
      );
  }
}