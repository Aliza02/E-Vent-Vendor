import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class heading extends StatelessWidget {
  String title;

  heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.pink,
        fontSize: Get.width * 0.065,
        fontFamily: AppFonts.manrope,
        fontWeight: AppFonts.extraBold,
      ),
    );
  }
}
