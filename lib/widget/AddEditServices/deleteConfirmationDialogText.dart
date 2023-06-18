import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

class dialog_Text extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color textColor;
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
