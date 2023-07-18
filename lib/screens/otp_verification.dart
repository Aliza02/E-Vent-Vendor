import 'package:eventually_vendor/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../widget/heading.dart';
import '../widget/logo.dart';
import '../widget/numberfield.dart';
import '../widget/subheading.dart';

class otp_verification extends StatefulWidget {
  otp_verification({super.key});

  @override
  State<otp_verification> createState() => _otp_verificationState();
}

class _otp_verificationState extends State<otp_verification> {
  Container buildOTPFields(int index, BuildContext context) {
    return Container(
      width: Get.width * 0.12,
      margin:
          EdgeInsets.fromLTRB(Get.width * 0.02, Get.height * 0.03, 0.0, 0.0),
      child: const Center(
          // child: numberField(title: ' ', maxLength: 1),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.04),
                child: logo(width: Get.width * 0.9, height: Get.height * 0.15),
              ),
              heading(
                title: 'Verification',
                heightFromTop: Get.height * 0.008,
                fontSize: Get.width * 0.11,
              ),
              subHeading(
                title: "Verify your Account",
                fontSize: Get.width * 0.04,
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.04),
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.bold,
                    color: AppColors.pink,
                    fontSize: Get.width * 0.08,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                child: Text(
                  'Enter the OTP code we just sent ',
                  style: TextStyle(
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.regular,
                    color: AppColors.grey,
                    fontSize: Get.width * 0.04,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                child: Text(
                  ' you on your registered Email.',
                  style: TextStyle(
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.regular,
                    color: AppColors.grey,
                    fontSize: Get.width * 0.04,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => buildOTPFields(index, context),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: Get.width * 0.08),
                  width: Get.width * 0.5,
                  height: Get.height * 0.07,
                  child: button(label: 'verify', onpressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
