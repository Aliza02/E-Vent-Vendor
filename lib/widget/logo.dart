import 'package:flutter/material.dart';
import '../constants/images.dart';

class logo extends StatelessWidget {
  final double width;
  final double height;

  const logo({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: width,
      height: height,
      AppImages.logo,
    );
  }
}
