import 'package:flutter/material.dart';

class serviceSubHeading extends StatelessWidget {
  final String title;
  final double fontSize;
  final String fontFamily;
  final Color fontColor;
  final FontWeight fontWeight;
  const serviceSubHeading(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontFamily,
      required this.fontColor,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
