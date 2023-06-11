import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';

class addImageBoxLabels extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  String fontFamily;

  addImageBoxLabels(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.fontWeight,
      required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.grey.withOpacity(0.8),
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
