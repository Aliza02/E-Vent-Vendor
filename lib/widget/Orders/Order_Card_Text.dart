import 'package:flutter/material.dart';

import '../../constants/font.dart';

class order_card_text extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  order_card_text(
      {super.key,
      required this.text,
      required this.fontColor,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: AppFonts.bold,
        fontFamily: AppFonts.manrope,
      ),
    );
  }
}
