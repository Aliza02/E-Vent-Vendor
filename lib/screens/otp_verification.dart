import 'package:email_auth/email_auth.dart';
import 'package:eventually_vendor/controller/signupController.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
  late EmailAuth emailAuth;
  final businessSignupController = Get.put(signUpController());
  void initState() {
    super.initState();
    emailAuth.sessionName = "Test Session";
  }

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
    void verify(String otp) {
      print(emailAuth.validateOtp(
          recipientMail: businessSignupController.emailController.value.text,
          userOtp: otp));
    }

    var otp;
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(
              //     6,
              //     (index) => buildOTPFields(index, context),
              //   ),
              // ),

              OtpTextField(
                numberOfFields: 6,
                borderColor: AppColors.pink,
                keyboardType: TextInputType.number,
                enabledBorderColor: AppColors.pink,
                focusedBorderColor: AppColors.pink,
                cursorColor: AppColors.pink,

                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  otp = verificationCode;
                  verify(otp);
                  // verifyOtp(otp);

                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text("Verification Code"),
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     });
                }, // end onSubmit
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: Get.width * 0.08),
                  width: Get.width * 0.5,
                  height: Get.height * 0.07,
                  child: button(
                    label: 'verify',
                    onpressed: () {
                      // verify();
                      // verifyOtp(otp);
                    },
                    borderRadius: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
