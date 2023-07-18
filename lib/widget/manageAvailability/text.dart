import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/colors.dart';

class text extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  Color fontColor;
  text(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontWeight,
      required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppFonts.manrope,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
