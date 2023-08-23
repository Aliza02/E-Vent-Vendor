import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../manageAvailability/text.dart';

class individual_order_stat extends StatelessWidget {
  final Color gradientColor1;
  final Color gradientColor2;
  final Color overlapContainerColor;
  final String noOfOrder;
  final String status;
  const individual_order_stat({
    super.key,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.overlapContainerColor,
    required this.noOfOrder,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.21,
      height: Get.height * 0.1,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.57, -0.82),
          end: const Alignment(-0.57, 0.82),
          colors: [
            gradientColor1,
            gradientColor2,
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12.0,
            top: -3,
            child: Transform.rotate(
              angle: 20,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: overlapContainerColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Get.width * 0.04,
              top: Get.height * 0.02,
            ),
            child: text(
              title: noOfOrder,
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.extraBold,
              fontColor: AppColors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Get.width * 0.025,
              top: Get.height * 0.044,
            ),
            child: text(
              title: status,
              fontSize: Get.width * 0.027,
              fontWeight: AppFonts.bold,
              fontColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
