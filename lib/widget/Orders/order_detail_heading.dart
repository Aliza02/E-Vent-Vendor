import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class order_detail_heading extends StatelessWidget {
  String title;
  order_detail_heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Get.width * 0.035,
        fontWeight: AppFonts.extraBold,
        fontFamily: AppFonts.manrope,
        color: AppColors.grey,
      ),
    );
  }
}
