import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String imagesrc;
  final double  imageHiegth;
  const MyImage({super.key,
  required this.imagesrc,
  required this.imageHiegth
  });

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(
      imagesrc),
      height: imageHiegth,);
  }
}