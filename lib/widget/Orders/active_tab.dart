import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';

class active_tab extends StatelessWidget {
  final String title;

  const active_tab({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.3,
      height: Get.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.orangeLight,
            spreadRadius: 0.5,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.05),
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            fontFamily: AppFonts.manrope,
            fontWeight: AppFonts.bold,
            fontSize: Get.width * 0.033,
          ),
        ),
      ),
    );
  }
}
