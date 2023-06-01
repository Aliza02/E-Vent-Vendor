import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
  }

  int currentindex = 1;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
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
                child: textFormField(title: 'Business Name'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: textFormField(title: 'Business Category'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: textFormField(title: 'Business Location'),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: numberField(title: 'CNIC', maxLength: 14),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: numberField(title: 'Contact Number', maxLength: 11),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    height: height * 0.01,
                    width: width * 0.08,
                    child: Checkbox(
                      activeColor: AppColors.pink,
                      side: BorderSide(
                        color: AppColors.pink,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
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
                  Container(
                    // margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                    child: Text(
                      'I agree to all the term and conditions',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.bold,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: width * 0.4,
                height: height * 0.06,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.035, 0.0, 0.0),
                child: button(
                  label: 'Create Account',
                  onpressed: () {
                    validationbusiness();
                  },
                ),
              ),
              SizedBox(height: height * 0.03),
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
                      Navigator.pushNamed(context, '/signup');
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
