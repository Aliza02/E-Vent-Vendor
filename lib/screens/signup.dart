import 'package:email_validator/email_validator.dart';
import 'package:eventually_vendor/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../controller/signupController.dart';
import '../firebaseMethods/userAuthentication.dart';
import '../widget/button.dart';
import '../widget/googleButton.dart';
import '../widget/heading.dart';
import '../widget/numberfield.dart';
import '../widget/progressbar.dart';
import '../widget/subheading.dart';
import '../widget/textfield.dart';
import '../widget/passwordfield.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  int currentindex = 0;

  final SignUpController = Get.put(signUpController());

  void validation() async {
    if (SignUpController.passwordController.text.isEmpty ||
        SignUpController.confirmPasswordController.text.isEmpty ||
        SignUpController.emailController.text.isEmpty ||
        SignUpController.nameController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete Fields',
          message: 'Enter complete details ',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (SignUpController.passwordController.text.toString().length < 6 ||
        SignUpController.confirmPasswordController.text.toString().length < 6) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Password is too short',
          message: 'Password should be atleast 6 characters',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (EmailValidator.validate(SignUpController.emailController.text) ==
        false) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Invalid Email',
          message: 'Enter a valid email',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (SignUpController.passwordController.text !=
        SignUpController.confirmPasswordController.text) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Different Passwords',
          message: 'Password and Confirm Password does not match',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else {
      currentindex += 1;
      Get.toNamed('/signup_business');
      currentindex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: logo(width: width * 0.4, height: height * 0.08),
              ),
              heading(
                title: 'Sign Up',
                heightFromTop: height * 0.008,
                fontSize: width * 0.11,
              ),
              subHeading(
                title: "Create an Account",
                fontSize: width * 0.04,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              progressbar(index: currentindex),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: textFormField(
                  title: 'Full Name',
                  textcontroller: SignUpController.nameController,
                ),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: textFormField(
                  title: 'Email',
                  textcontroller: SignUpController.emailController,
                ),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(
                  title: 'Password',
                  passwordController: SignUpController.passwordController,
                ),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(
                  title: 'Confirm Password',
                  passwordController:
                      SignUpController.confirmPasswordController,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: width * 0.4,
                height: height * 0.06,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.035, 0.0, 0.0),
                child: button(
                  label: 'Next',
                  onpressed: () {
                    validation();
                  },
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.pink,
                      height: 20.0,
                      thickness: 2,
                      indent: 9,
                      endIndent: 9,
                    ),
                  ),
                  Text(
                    'or continue with',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.regular,
                      fontSize: width * 0.04,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.pink,
                      height: 20.0,
                      thickness: 2,
                      indent: 9,
                      endIndent: 9,
                    ),
                  ),
                ],
              ),
              googleButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: width * 0.04,
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
                        fontSize: width * 0.04,
                        color: AppColors.pink,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.extraBold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
