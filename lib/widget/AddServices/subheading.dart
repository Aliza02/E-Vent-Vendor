import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class serviceSubHeading extends StatelessWidget {
  String title;
  double fontSize;
  String fontFamily;
  Color fontColor;
  FontWeight fontWeight;
  serviceSubHeading(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontFamily,
      required this.fontColor,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
        fontSize: this.fontSize,
        fontFamily: this.fontFamily,
        color: this.fontColor,
        fontWeight: this.fontWeight,
      ),
    );
  }
}
