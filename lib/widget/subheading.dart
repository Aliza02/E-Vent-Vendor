import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';
import '../constants/constant.dart';
import '../constants/font.dart';

class subHeading extends StatefulWidget {
  String title;
  double fontSize;
  subHeading({super.key, required this.title, required this.fontSize});

  @override
  State<subHeading> createState() => _subHeadingState();
}

class _subHeadingState extends State<subHeading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.title,
        style: TextStyle(
          fontFamily: manrope,
          fontWeight: regular,
          color: AppColors.grey,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
