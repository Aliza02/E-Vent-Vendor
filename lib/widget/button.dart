import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

class button extends StatelessWidget {
  final String label;

  final Function onpressed;
  const button({super.key, required this.label, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onpressed(),
      style: ElevatedButton.styleFrom(
        elevation: 10.0,
        shadowColor: AppColors.pink.withOpacity(0.4),
        backgroundColor: AppColors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: AppFonts.manrope,
          fontWeight: AppFonts.semiBold,
          fontSize: Get.width * 0.04,
          color: Colors.white,
        ),
      ),
    );
  }
}
