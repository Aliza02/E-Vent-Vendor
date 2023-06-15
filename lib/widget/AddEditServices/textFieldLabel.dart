import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

class Label extends StatelessWidget {
  final String title;
  const Label({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: Get.width * 0.87,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: Get.width * 0.04,
          fontFamily: AppFonts.manrope,
          color: AppColors.grey.withOpacity(0.8),
          fontWeight: AppFonts.bold,
        ),
      ),
    );
  }
}
