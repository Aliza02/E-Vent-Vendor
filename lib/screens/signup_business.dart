import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../widget/button.dart';
import '../widget/heading.dart';
import '../widget/logo.dart';
import '../widget/numberfield.dart';
import '../widget/progressbar.dart';
import '../widget/subheading.dart';
import '../widget/textfield.dart';

class signup_business extends StatefulWidget {
  const signup_business({super.key});

  @override
  State<signup_business> createState() => _signup_businessState();
}

class _signup_businessState extends State<signup_business> {
  void validationbusiness() {
    currentindex += 1;
    Get.toNamed('/drawer');
  }

  int currentindex = 1;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child: logo(width: Get.width * 0.4, height: Get.height * 0.08),
              ),
              heading(
                title: 'Sign Up',
                heightFromTop: Get.height * 0.008,
                fontSize: Get.width * 0.11,
              ),
              subHeading(
                title: "Create an Account",
                fontSize: Get.width * 0.04,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              progressbar(index: currentindex),
              Container(
                height: Get.height * 0.05,
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child: const textFormField(title: 'Business Name'),
              ),
              Container(
                height: Get.height * 0.05,
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child: const textFormField(title: 'Business Category'),
              ),
              Container(
                height: Get.height * 0.05,
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child: const textFormField(title: 'Business Location'),
              ),
              Container(
                height: Get.height * 0.05,
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child: const numberField(title: 'CNIC', maxLength: 14),
              ),
              Container(
                height: Get.height * 0.05,
                margin: EdgeInsets.only(top: Get.height * 0.02),
                child:
                    const numberField(title: 'Contact Number', maxLength: 11),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                    width: Get.width * 0.08,
                    child: Checkbox(
                      activeColor: AppColors.pink,
                      side: const BorderSide(
                        color: AppColors.pink,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.pink,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    'I agree to all the term and conditions',
                    style: TextStyle(
                      fontSize: Get.width * 0.03,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.bold,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: Get.width * 0.4,
                height: Get.height * 0.06,
                margin: EdgeInsets.only(top: Get.height * 0.035),
                child: button(
                  label: 'Create Account',
                  onpressed: () {
                    validationbusiness();
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Get.width * 0.04,
                      color: AppColors.grey,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.medium,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        color: AppColors.pink,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.extraBold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
