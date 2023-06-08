import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/font.dart';

//  button for add/edit service
class Button extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final Color buttonColor;
  final double fontSize;
  final double borderRadius;
  const Button(
      {super.key,
      required this.label,
      required this.width,
      required this.height,
      required this.buttonColor,
      required this.fontSize,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
          vertical: height * 0.1, horizontal: width * 0.03),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: AppFonts.manrope,
            fontWeight: AppFonts.bold,
          ),
        ),
      ),
    );
  }
}
