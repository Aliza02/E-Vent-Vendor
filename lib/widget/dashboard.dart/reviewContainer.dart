import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../profile/reviewerImage.dart';

class reviewContainer extends StatelessWidget {
  final int colorIndex;
  final String review;
  final int ratings;
  const reviewContainer({
    super.key,
    required this.colorIndex,
    required this.review,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * 0.05,
        vertical: Get.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: AppColors.reviewsColor[colorIndex],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reviewerImage(index: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  ratings,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      left: Get.width * 0.001,
                      top: Get.height * 0.01,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.star,
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.5,
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  review,
                  style: TextStyle(
                    fontFamily: AppFonts.manrope,
                    fontSize: Get.width * 0.035,
                    fontWeight: AppFonts.medium,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
