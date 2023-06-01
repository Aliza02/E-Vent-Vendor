import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class serviceHeading extends StatelessWidget {
  String title;
  double fontSize;
  String fontFamily;
  Color fontColor;
  FontWeight fontWeight;
  serviceHeading(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontColor,
      required this.fontFamily,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: this.fontSize,
          fontFamily: this.fontFamily,
          color: this.fontColor,
          fontWeight: this.fontWeight),
    );
  }
}
