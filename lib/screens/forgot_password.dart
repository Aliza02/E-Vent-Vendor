import 'package:eventually_vendor/constants/images.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/forgot_password_image.dart';
import 'package:eventually_vendor/widget/heading.dart';
import 'package:eventually_vendor/widget/subheading.dart';
import 'package:eventually_vendor/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.screenBackground,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),
          width: width,
          height: height,
          child: Column(
            children: [
              heading(
                  title: 'Forgot Password',
                  heightFromTop: height * 0.03,
                  fontSize: width * 0.07),
              forgotPasswordImage(
                imageUrl: AppImages.forgotPassword,
              ), // image
              subHeading(
                  title: "Forgot password?No worries, let's",
                  fontSize: width * 0.05),

              subHeading(title: "recover it.", fontSize: width * 0.05),

              Container(
                margin: EdgeInsets.symmetric(vertical: width * 0.1),
                child: textFormField(title: 'Enter Email'),
              ),

              Container(
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
