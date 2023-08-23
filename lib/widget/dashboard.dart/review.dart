import 'package:eventually_vendor/widget/dashboard.dart/reviewContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../manageAvailability/text.dart';

class review extends StatelessWidget {
  const review({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> reviews = [
      "Very Nice Services",
      "Had Bad Experience",
      "Highly recommended!! Everything went smooth and everyone praised the setting."
    ];
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3FDF4E52),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.015),
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
            child: text(
              title: 'Recent Reviews',
              fontColor: AppColors.grey,
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return reviewContainer(
                colorIndex: index,
                review: reviews[index],
              );
            },
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/order');
            },
            child: Container(
              margin: EdgeInsets.only(
                left: Get.width * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  text(
                    title: 'View more',
                    fontSize: Get.width * 0.035,
                    fontWeight: AppFonts.bold,
                    fontColor: AppColors.pink,
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
          ),
        ],
      ),
    );
  }
}
