import 'package:eventually_vendor/constants/images.dart';
import 'package:eventually_vendor/widget/forgot_password_image.dart';
import 'package:eventually_vendor/widget/heading.dart';
import 'package:eventually_vendor/widget/passwordfield.dart';
import 'package:eventually_vendor/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            children: [
              heading(
                  title: 'New Password',
                  heightFromTop: height * 0.03,
                  fontSize: width * 0.07),
              forgotPasswordImage(
                imageUrl: AppImages.resetPassword,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: width * 0.07),
                child: PasswordField(
                  title: 'New Password',
                ),
              ),
              Container(
                child: PasswordField(
                  title: 'Confirm Password',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: width * 0.07),
                width: width * 0.5,
                height: height * 0.07,
                child: button(label: 'Enter', onpressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
