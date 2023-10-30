import 'package:eventually_vendor/widget/dashboard.dart/top_orders_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../manageAvailability/text.dart';

class top_orders extends StatelessWidget {
  top_orders({super.key});

  final List<String> events = [
    'Engagement',
    'Baraat',
    'Birthdays',
    'Farewells'
  ];
  final List<String> eventRatio = ['10%', '20%', '30%', '40%'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      // height: Get.height * 0.3,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F89DB21),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Get.height * 0.01,
          ),
          text(
            title: 'Top Orders',
            fontSize: Get.width * 0.04,
            fontWeight: AppFonts.bold,
            fontColor: AppColors.grey,
          ),
          SizedBox(height: Get.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: events.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return top_orders_container(
                        eventRatio: eventRatio[index],
                        event: events[index],
                        containerBGColor:
                            AppColors.topOrdersContainerColors[index],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
