import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class privacyPolicy extends StatelessWidget {
  privacyPolicy({super.key});

  final List<String> title = [
    'Personal Information',
    'Non personal Information',
    'Use of Informtion',
    'Sharing of Information',
    'Security',
    'Changes to Privacy Policy',
  ];
  final List<String> details = [
    " When you register an account, we collect your name, email address, and password. \n If you make a booking, we collect information about the event, your preferences, and payment details.",
    "We may collect information about your use of the application, including pages visited, interactions, and other analytical data. \n We may collect information about the device you are using, including the device type, operating system, and unique device identifiers.",
    "We use the information we collect for the following purposes: \n 1.To provide and maintain our services. \n 2. To process your bookings and transactions.\n 3.To personalize your experience and improve our services.",
    "We may share your information with third parties in the following circumstances: \n 1. Your booking information may be shared with the specific vendor providing the service.\n 2. We may engage third-party service providers to assist with various aspects of our business.",
    "We take reasonable measures to protect your information from unauthorized access or disclosure. However, no data transmission over the internet can be guaranteed as 100% secure.",
    "We may update this Privacy Policy from time to time. Any changes will be posted on this page, and the effective date will be updated.",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.3),
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.1,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColors.appBar.withOpacity(0.3),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Get.width * 0.1),
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        color: AppColors.pink,
                        fontSize: Get.width * 0.07,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: Get.height,
                width: Get.width * 0.9,
                margin: EdgeInsets.only(
                    // top: Get.height * 0.07,
                    // left: Get.width * 0.05,
                    ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Get.width * 0.06),
                  border: Border.all(
                    color: AppColors.pink.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              title: title[index],
                              fontSize: Get.width * 0.06,
                              fontWeight: AppFonts.bold,
                              fontColor: AppColors.grey,
                            ),
                            text(
                              title: details[index],
                              fontSize: Get.width * 0.03,
                              fontWeight: AppFonts.bold,
                              fontColor: AppColors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
