import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class aboutus extends StatefulWidget {
  const aboutus({super.key});

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
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
            ),
          ),
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
                    'About us',
                    style: TextStyle(
                        color: AppColors.pink,
                        fontSize: Get.width * 0.07,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.04),
              child: text(
                title: 'Welcome to E-Vent!',
                fontSize: Get.width * 0.09,
                fontWeight: AppFonts.extraBold,
                fontColor: AppColors.pink,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04,
              ),
              child: text(
                title:
                    "We are an event planning platform connecting vendors with customers to create extraordinary experiences. As a vendor on EventuAlly, you'll gain access to a vast network of customers looking for your services. Showcase your talents, expand your business reach, and grow your brand presence. With our user-friendly app, managing your bookings, availability, and customer interactions has never been easier. Join us today and let EventuAlly help you take your business to new heights!",
                fontSize: Get.width * 0.04,
                fontWeight: AppFonts.medium,
                fontColor: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
