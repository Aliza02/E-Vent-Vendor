import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import 'individual_order_stat.dart';

class order_stats_section extends StatelessWidget {
  const order_stats_section({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      // height: Get.height * 0.3,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3FF77000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          // SizedBox(height: Get.height * 0.012),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.014),
            child: text(
              title: 'Orders Stats',
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
              fontColor: AppColors.grey,
            ),
          ),
          // SizedBox(height: Get.height * 0.006),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              individual_order_stat(
                gradientColor1: AppColors.gradientColor1[0],
                gradientColor2: AppColors.gradientColor2[0],
                overlapContainerColor: AppColors.overlapContainerColor[0],
                noOfOrder: '40',
                status: 'Orders Pending',
              ),
              individual_order_stat(
                gradientColor1: AppColors.gradientColor1[1],
                gradientColor2: AppColors.gradientColor2[1],
                overlapContainerColor: AppColors.overlapContainerColor[1],
                noOfOrder: '15',
                status: 'Orders Completed',
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              individual_order_stat(
                gradientColor1: AppColors.gradientColor1[2],
                gradientColor2: AppColors.gradientColor2[2],
                overlapContainerColor: AppColors.overlapContainerColor[2],
                noOfOrder: '12',
                status: 'Payment Pending',
              ),
              individual_order_stat(
                gradientColor1: AppColors.gradientColor1[3],
                gradientColor2: AppColors.gradientColor2[3],
                overlapContainerColor: AppColors.overlapContainerColor[3],
                noOfOrder: '18',
                status: 'Payment Completed',
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/order');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  title: 'View All Orders',
                  fontSize: Get.width * 0.035,
                  fontWeight: AppFonts.bold,
                  fontColor: const Color(0xFFF77000),
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.01),
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(
                    AppIcons.orderStatsArrow,
                    height: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
