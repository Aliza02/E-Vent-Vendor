import 'package:eventually_vendor/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/images.dart';

class googleButton extends StatefulWidget {
  const googleButton({super.key});

  @override
  State<googleButton> createState() => _googleButtonState();
}

class _googleButtonState extends State<googleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Get.width * 0.07),
        border: Border.all(
          color: AppColors.googleButtonBorder,
          width: 1.3,
        ),
      ),
      height: Get.height * 0.09,
      width: Get.width * 0.2,
      child: Image.asset(AppImages.googleLogo),
    );
  }
}
