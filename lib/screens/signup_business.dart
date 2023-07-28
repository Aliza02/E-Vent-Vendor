import 'package:email_auth/email_auth.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../controller/signupController.dart';
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
  int currentindex = 1;
  bool isChecked = false;
  final businessSignupController = Get.put(signUpController());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    // emailAuth = new EmailAuth(
    //   sessionName: "Sample session",
    // );
  }

  void validationbusiness() {
    if (businessSignupController.businessNameController.text.isEmpty ||
        businessSignupController.businessCategoryController.text.isEmpty ||
        businessSignupController.businessLocationController.text.isEmpty ||
        businessSignupController.cnicController.text.isEmpty ||
        businessSignupController.phoneController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete Fields',
          message: 'Enter complete details ',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (businessSignupController.cnicController.text.toString().length <
        14) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete',
          message: 'Enter complete CNIC number',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (businessSignupController.phoneController.text.toString().length <
        11) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incorrect Number',
          message: 'Enter correct Number',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (isChecked == false) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Agreement',
          message: 'Agree to the terms and conditions',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else {
      currentindex += 1;

      print(businessSignupController.emailController.text);

      print(businessSignupController.passwordController.text);

      // otpVerification(signupcontroller.phoneController.text);
      // Get.toNamed('/otpverification');

      Signup(
          email: businessSignupController.emailController.text,
          name: businessSignupController.nameController.text,
          password: businessSignupController.passwordController.text,
          confirmPassword:
              businessSignupController.confirmPasswordController.text,
          businessName: businessSignupController.businessNameController.text,
          businessCategory:
              businessSignupController.businessCategoryController.text,
          businessLocation:
              businessSignupController.businessLocationController.text,
          CNIC: businessSignupController.cnicController.text,
          phone: businessSignupController.phoneController.text);

      // Signin(
      //     email: businessSignupController.emailController.text,
      //     password: businessSignupController.passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.02),
                  child:
                      logo(width: Get.width * 0.4, height: Get.height * 0.08),
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
                  child: textFormField(
                    title: 'Business Name',
                    textcontroller:
                        businessSignupController.businessNameController,
                  ),
                ),
                Container(
                  height: Get.height * 0.05,
                  margin: EdgeInsets.only(top: Get.height * 0.02),
                  child: textFormField(
                    title: 'Business Category',
                    textcontroller:
                        businessSignupController.businessCategoryController,
                  ),
                ),
                Container(
                  height: Get.height * 0.05,
                  margin: EdgeInsets.only(top: Get.height * 0.02),
                  child: textFormField(
                    title: 'Business Location',
                    textcontroller:
                        businessSignupController.businessLocationController,
                  ),
                ),
                Container(
                  height: Get.height * 0.05,
                  margin: EdgeInsets.only(top: Get.height * 0.02),
                  child: numberField(
                    title: 'CNIC',
                    maxLength: 14,
                    controller: businessSignupController.cnicController,
                  ),
                ),
                Container(
                  height: Get.height * 0.05,
                  margin: EdgeInsets.only(top: Get.height * 0.02),
                  child: numberField(
                    title: 'Contact Number',
                    maxLength: 13,
                    controller: businessSignupController.phoneController,
                  ),
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
                    borderRadius: 20,
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
      ),
    );
  }
}
