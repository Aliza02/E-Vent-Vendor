import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

class heading extends StatefulWidget {
  final double heightFromTop;
  final double fontSize;
  final String title;
  const heading(
      {super.key,
      required this.title,
      required this.heightFromTop,
      required this.fontSize});

  @override
  State<heading> createState() => _headingState();
}

class _headingState extends State<heading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.heightFromTop),
      child: Text(
        widget.title,
        style: TextStyle(
          color: AppColors.black,
          fontFamily: AppFonts.manrope,
          fontSize: widget.fontSize,
          fontWeight: AppFonts.extraBold,
        ),
      ),
    );
  }
}
