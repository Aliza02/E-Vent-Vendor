import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/widget/BottomNavBar/bottomNavBar.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/manageAvailability/header.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/font.dart';
import '../../constants/images.dart';
import '../../widget/manageAvailability/heading.dart';

class makeOtherDayUnavailable extends StatefulWidget {
  const makeOtherDayUnavailable({super.key});

  @override
  State<makeOtherDayUnavailable> createState() =>
      _makeOtherDayUnavailableState();
}

class _makeOtherDayUnavailableState extends State<makeOtherDayUnavailable> {
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back_ios,
          //     color: AppColors.grey,
          //   ),
          // ),
        ),
        bottomNavigationBar: bottomNavBar(),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: Get.height * 0.07),
                  child: Image.asset(AppImages.unavailable)),
              heading(title: 'Made Unavailable'),
              text(
                title: 'You will now be shown unavailable',
                fontSize: Get.width * 0.035,
                fontWeight: AppFonts.regular,
                fontColor: AppColors.grey,
              ),
              text(
                title: 'for any further orders on',
                fontSize: Get.width * 0.035,
                fontWeight: AppFonts.regular,
                fontColor: AppColors.grey,
              ),
              text(
                title:
                    "${orderController.unavailabilityDate} ${orderController.unavailabilityTime[0]}- ${orderController.unavailabilityTime[1]}",
                fontSize: Get.width * 0.035,
                fontWeight: AppFonts.bold,
                fontColor: AppColors.grey,
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.05),
                child: button(
                  label: 'Manage other days',
                  onpressed: () {
                    Get.offAllNamed('/drawer');
                    
                    orderController.unavailabilityDate.value = '';
                    orderController.unavailabilityTime.clear();
                  },
                  borderRadius: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
