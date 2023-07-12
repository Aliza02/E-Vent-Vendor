import 'package:eventually_vendor/constants/images.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/forgot_password_image.dart';
import 'package:eventually_vendor/widget/heading.dart';
import 'package:eventually_vendor/widget/subheading.dart';
import 'package:eventually_vendor/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Get.height * 0.03),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.02),
                  heading(
                      title: 'Forgot Password',
                      heightFromTop: Get.height * 0.03,
                      fontSize: Get.width * 0.07),
                ],
              ),
              const forgotPasswordImage(
                imageUrl: AppImages.forgotPassword,
              ), // image
              subHeading(
                  title: "Forgot password?No worries, let's",
                  fontSize: Get.width * 0.05),

              subHeading(title: "recover it.", fontSize: Get.width * 0.05),

              Container(
                margin: EdgeInsets.symmetric(vertical: Get.width * 0.1),
                // child: const textFormField(title: 'Enter Email'),
              ),

              Container(
                width: Get.width * 0.5,
                height: Get.height * 0.07,
                child: button(label: 'Enter', onpressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
