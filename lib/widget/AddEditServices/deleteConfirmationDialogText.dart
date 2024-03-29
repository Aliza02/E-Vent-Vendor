import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

class dialog_Text extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  dialog_Text(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: AppFonts.manrope,
        fontWeight: fontWeight,
      ),
    );
  }
}
