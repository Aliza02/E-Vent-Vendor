import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../manageAvailability/text.dart';

class top_orders_container extends StatelessWidget {
  final Color containerBGColor;
  const top_orders_container({
    super.key,
    required this.containerBGColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.062,
      width: Get.width * 0.34,
      margin: EdgeInsets.only(
        bottom: Get.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Get.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: containerBGColor,
        borderRadius: BorderRadius.circular(Get.width * 0.03),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: Get.width * 0.01,
            ),
            child: Image.asset('assets/images/topOrderImage1.png'),
          ),
          SizedBox(
            width: Get.width * 0.18,
            // padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
            child: text(
              title: 'Birthdays',
              fontSize: Get.width * 0.03,
              fontColor: AppColors.grey,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: Get.width * 0.01,
            ),
            child: text(
              title: '30%',
              fontColor: AppColors.grey,
              fontSize: Get.width * 0.032,
              fontWeight: AppFonts.bold,
            ),
          ),
        ],
      ),
    );
  }
}
