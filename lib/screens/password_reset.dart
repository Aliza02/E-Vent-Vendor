import 'package:eventually_vendor/constants/images.dart';
import 'package:eventually_vendor/widget/forgot_password_image.dart';
import 'package:eventually_vendor/widget/heading.dart';
import 'package:eventually_vendor/widget/passwordfield.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widget/button.dart';

class passwrordReset extends StatefulWidget {
  const passwrordReset({super.key});

  @override
  State<passwrordReset> createState() => _passwrordResetState();
}

class _passwrordResetState extends State<passwrordReset> {
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
              heading(
                  title: 'New Password',
                  heightFromTop: Get.height * 0.03,
                  fontSize: Get.width * 0.07),
              const forgotPasswordImage(
                imageUrl: AppImages.resetPassword,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: Get.width * 0.07),
                // child: const PasswordField(
                //   title: 'New Password',
                // ),
              ),
              // const PasswordField(
              //   title: 'Confirm Password',
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: Get.width * 0.07),
                width: Get.width * 0.5,
                height: Get.height * 0.07,
                child: button(
                  label: 'Enter',
                  onpressed: () {},
                  borderRadius: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
