import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';

class order_heading extends StatelessWidget {
  final String title;

  order_heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.pink,
        fontSize: Get.width * 0.07,
        fontFamily: AppFonts.manrope,
        fontWeight: AppFonts.extraBold,
      ),
    );
  }
}
