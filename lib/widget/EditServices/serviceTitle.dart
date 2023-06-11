import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ServiceCardDetails extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color fontColor;
  final double opacity;

  ServiceCardDetails(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontFamily,
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
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
