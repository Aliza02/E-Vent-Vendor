import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

class subHeading extends StatefulWidget {
  final String title;
  final double fontSize;
  const subHeading({super.key, required this.title, required this.fontSize});

  @override
  State<subHeading> createState() => _subHeadingState();
}

class _subHeadingState extends State<subHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
        fontFamily: AppFonts.manrope,
        fontWeight: AppFonts.regular,
        color: AppColors.grey,
        fontSize: widget.fontSize,
      ),
    );
  }
}
