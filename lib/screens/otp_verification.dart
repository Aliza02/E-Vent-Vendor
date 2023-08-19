import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/signupController.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../OTPMethods/otpmethods.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../widget/heading.dart';
import '../widget/logo.dart';
import '../widget/subheading.dart';

class otp_verification extends StatefulWidget {
  otp_verification({super.key});

  @override
  State<otp_verification> createState() => _otp_verificationState();
}

class _otp_verificationState extends State<otp_verification> {
  String otp = '';
  final signupcontroller = Get.put(signUpController());
  bool clear = false;

  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (signupcontroller.secondsRemainingforOtp.value > 0) {
          signupcontroller.secondsRemainingforOtp.value--;
        } else {
          timer.cancel();
          signupcontroller.secondsRemainingforOtp.value = 50;
          generateOtp();
        }
      });
    });
  }

  void initState() {
    super.initState();
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
                  'Enter the OTP code we just sent \n you on your registered Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.regular,
                    color: AppColors.grey,
                    fontSize: Get.width * 0.04,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              OtpTextField(
                numberOfFields: 6,
                borderColor: AppColors.pink,
                keyboardType: TextInputType.number,
                enabledBorderColor: AppColors.pink,
                focusedBorderColor: AppColors.pink,
                cursorColor: AppColors.pink,
                clearText: clear,

                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  print(verificationCode);
                  otp = verificationCode;
                }, // end onSubmit
              ),
              Obx(
                () => Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      left: Get.width * 0.15, top: Get.height * 0.03),
                  child: Text(
                    "00:${signupcontroller.secondsRemainingforOtp.value.toString()}",
                    style: TextStyle(
                      color: AppColors.pink,
                      fontFamily: AppFonts.manrope,
                      fontSize: Get.width * 0.04,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: Get.width * 0.1,
                ),
                child: RichText(
                  text: TextSpan(
                    text: "We’ve  sent a verification code to your email ",
                    style: TextStyle(
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.medium,
                      fontSize: Get.width * 0.035,
                      color: AppColors.grey,
                    ),
                    children: [
                      TextSpan(
                        text:
                            " ${signupcontroller.emailController.text.replaceRange(4, 10, "*****")}",
                        style: TextStyle(
                          fontFamily: AppFonts.manrope,
                          fontWeight: AppFonts.bold,
                          fontSize: Get.width * 0.035,
                          color: AppColors.pink,
                        ),
                      ),
                      TextSpan(
                        text: ' You can check your inbox.',
                        style: TextStyle(
                          fontFamily: AppFonts.manrope,
                          fontWeight: AppFonts.medium,
                          fontSize: Get.width * 0.035,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  timer.cancel();
                  signupcontroller.secondsRemainingforOtp.value = 50;
                  startTimer();
                  generateOtp();
                  print(otp);
                  print(signupcontroller.OTPCode.value);
                  sendOTP();
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    left: Get.width * 0.1,
                    top: Get.height * 0.01,
                  ),
                  child: Text(
                    "I didn't receive the code. Send again",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.pink,
                      fontFamily: AppFonts.manrope,
                      fontSize: Get.width * 0.04,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(vertical: Get.width * 0.08),
                  width: Get.width * 0.5,
                  height: Get.height * 0.07,
                  child: signupcontroller.successfullSignup.value == true
                      ? const SpinKitFadingCircle(
                          color: AppColors.pink,
                        )
                      : button(
                          label: 'verify',
                          onpressed: () {
                            print(signupcontroller.successfullSignup.value);
                            // signupcontroller.successfullSignup.value = true;
                            if (otp == signupcontroller.OTPCode.value) {
                              Signup(
                                  email: signupcontroller.emailController.text,
                                  name: signupcontroller.nameController.text,
                                  password:
                                      signupcontroller.passwordController.text,
                                  confirmPassword: signupcontroller
                                      .confirmPasswordController.text,
                                  businessName: signupcontroller
                                      .businessNameController.text,
                                  businessCategory: signupcontroller
                                      .businessCategoryController.text,
                                  businessLocation: signupcontroller
                                      .businessLocationController.text,
                                  CNIC: signupcontroller.cnicController.text,
                                  phone: signupcontroller.phoneController.text);
                              setState(() {
                                clear = true;
                              });
                            } else {
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Incorrect OTP',
                                  message: 'Enter correct OTP.',
                                  backgroundColor: AppColors.pink,
                                  duration: Duration(seconds: 2),
                                  icon: Icon(Icons.incomplete_circle_rounded),
                                ),
                              );
                            }
                          },
                          borderRadius: 20,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
