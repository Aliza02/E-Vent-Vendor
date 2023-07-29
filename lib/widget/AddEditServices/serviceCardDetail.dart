import 'package:eventually_vendor/widget/AddEditServices/serviceCardText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

class ServiceCardDetails extends StatelessWidget {
  const ServiceCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.59,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.01),
            child: ServiceCardText(
              text: 'Birthday Setup',
              fontSize: Get.width * 0.05,
              fontColor: AppColors.grey,
              fontWeight: AppFonts.semiBold,
              opacity: 1.0,
            ),
          ),
          ServiceCardText(
              text:
                  'Complete stage decoration, tables setup with real flowers and balloons',
              fontSize: Get.width * 0.03,
              fontColor: AppColors.grey,
              fontWeight: AppFonts.medium,
              opacity: 1.0),
          // description

          Row(
            children: [
              ServiceCardText(
                text: 'Rs 20,000',
                fontSize: Get.width * 0.04,
                fontColor: AppColors.pink,
                fontWeight: AppFonts.extraBold,
                opacity: 1.0,
              ),
              //
              const Spacer(),
              ServiceCardText(
                text: 'Per 20 person',
                fontSize: Get.width * 0.03,
                fontColor: AppColors.grey,
                fontWeight: AppFonts.regular,
                opacity: 0.8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
