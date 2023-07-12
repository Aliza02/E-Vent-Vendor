import 'package:eventually_vendor/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  int currentindex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void validation() async {
    print(_emailController.text);
    print(_passwordController.text);
    await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    currentindex += 1;
    print(currentindex);
    Get.toNamed('/signup_business');
    currentindex = 0;
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
                  textcontroller: _nameController,
                ),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: textFormField(
                  title: 'Email',
                  textcontroller: _emailController,
                ),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(
                  title: 'Password',
                  passwordController: _passwordController,
                ),
              ),
              Container(
                height: height * 0.05,
                margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
                child: PasswordField(
                  title: 'Confirm Password',
                  passwordController: _confirmPasswordController,
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
