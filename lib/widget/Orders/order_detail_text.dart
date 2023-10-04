import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class order_detail_text extends StatelessWidget {
  String title;

  double opacity;
  order_detail_text({super.key, required this.title, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      title,
      style: TextStyle(
        fontSize: Get.width * 0.03,
        fontWeight: AppFonts.semiBold,
        fontFamily: AppFonts.manrope,
        color: AppColors.grey.withOpacity(opacity),
      ),
    );
  }
}
