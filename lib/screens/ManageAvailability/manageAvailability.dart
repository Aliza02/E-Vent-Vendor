import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

import '../../firebaseMethods/addService.dart';
import '../../widget/manageAvailability/header.dart';

class manageAvailability extends StatelessWidget {
  manageAvailability({super.key});
  final pagecontroller = Get.put(testController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const header(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  text(
                    title: 'Ongoing',
                    fontSize: Get.width * 0.06,
                    fontWeight: AppFonts.bold,
                    fontColor: AppColors.grey,
                  ),
                  const Spacer(),
                  button(
                    label: 'Make Unavailable',
                    onpressed: () {
                      Get.toNamed('/makeUnavailable');
                    },
                    borderRadius: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: Get.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          text(
                            title: '9:00 AM',
                            fontSize: Get.width * 0.04,
                            fontWeight: AppFonts.regular,
                            fontColor: AppColors.grey,
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: Get.height * 0.01,
                              ),
                              padding: EdgeInsets.only(
                                top: Get.height * 0.01,
                                left: Get.width * 0.015,
                              ),
                              // height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                color: AppColors.orderColors[index],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    title: 'Order Number:11111',
                                    fontSize: Get.width * 0.04,
                                    fontWeight: AppFonts.bold,
                                    fontColor: AppColors.white,
                                  ),
                                  text(
                                    title: 'Shadi Package',
                                    fontSize: Get.width * 0.025,
                                    fontWeight: AppFonts.bold,
                                    fontColor: AppColors.white,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.02,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(height: Get.height * 0.05),
                                        CircleAvatar(
                                          radius: 12.0,
                                          backgroundImage: AssetImage(
                                              'assets/images/profileimage.png'),
                                        ),
                                        SizedBox(width: Get.width * 0.01),
                                        text(
                                          title: 'User Name',
                                          fontSize: Get.width * 0.034,
                                          fontWeight: AppFonts.regular,
                                          fontColor: AppColors.white,
                                        ),
                                        const Spacer(),
                                        text(
                                            title: '9:00 AM - 12:00 PM',
                                            fontSize: Get.width * 0.034,
                                            fontWeight: AppFonts.regular,
                                            fontColor: AppColors.white),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
