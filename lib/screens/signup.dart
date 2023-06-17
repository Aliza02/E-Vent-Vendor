import 'package:eventually_vendor/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
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
  void validation() {
    currentindex += 1;
    print(currentindex);
    Get.toNamed('/signup_business');
    currentindex = 0;
  }

  int currentindex = 0;
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
                child: textFormField(title: 'Full Name'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: textFormField(title: 'Email'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(title: 'Password'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(title: 'Confirm Password'),
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
