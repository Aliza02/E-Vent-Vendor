import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/font.dart';

class ServiceCardText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double opacity;

  ServiceCardText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontColor,
      required this.fontWeight,
      required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: fontColor.withOpacity(opacity),
        fontSize: fontSize,
        fontFamily: AppFonts.manrope,
        fontWeight: fontWeight,
      ),
    );
  }
}
