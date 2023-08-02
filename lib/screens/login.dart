import 'package:email_validator/email_validator.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/widget/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../controller/signinController.dart';
import '../widget/button.dart';
import '../widget/googleButton.dart';
import '../widget/heading.dart';
import '../widget/subheading.dart';
import '../widget/textfield.dart';
import '../widget/passwordfield.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool isChecked = false;
  final signincontroller = Get.put(signinController());

  void initState() {
    super.initState();
    // _loadRememberMeStatus();
  }

  void validate() async {
    if (signincontroller.emailController.text.isEmpty ||
        signincontroller.passwordController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete Fields',
          message: 'Enter complete details ',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else if (EmailValidator.validate(signincontroller.emailController.text) ==
        false) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incorrect Email Format',
          message: 'Enter a correct email',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else {
      _login();
    }
  }

  saveRememberMeStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', value);
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: signincontroller.emailController.text,
              password: signincontroller.passwordController.text);

      if (userCredential.user != null) {
        signincontroller.isLoggedIn.value = true;
        if (signincontroller.isRemember.value) {
          saveRememberMeStatus(true);
          Get.toNamed('/drawer');
        }
      }
    } on FirebaseAuthException catch (e) {
      print('Failed to log in: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.04),
                  child:
                      logo(width: Get.width * 0.9, height: Get.height * 0.15),
                ),
                heading(
                  title: 'Welcome Back',
                  heightFromTop: Get.height * 0.008,
                  fontSize: Get.width * 0.11,
                ),
                subHeading(
                  title: "Welcome back, you've been missed.",
                  fontSize: Get.width * 0.04,
                ),
                Container(
                  height: Get.height * 0.07,
                  margin: EdgeInsets.only(top: Get.height * 0.03),
                  child: textFormField(
                    title: 'Email',
                    textcontroller: signincontroller.emailController,
                  ),
                ),
                Container(
                  height: Get.height * 0.07,
                  margin: EdgeInsets.only(top: Get.height * 0.03),
                  child: PasswordField(
                    title: 'Password',
                    passwordController: signincontroller.passwordController,
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
                            signincontroller.isRemember.value = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Remember me',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        fontFamily: AppFonts.manrope,
                        color: AppColors.grey,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/forgetpassword');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: AppFonts.manrope,
                          fontWeight: AppFonts.bold,
                          color: AppColors.pink,
                          fontSize: Get.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: Get.width * 0.4,
                  height: Get.height * 0.06,
                  margin: EdgeInsets.only(top: Get.height * 0.04),
                  child: button(
                    label: 'Login',
                    onpressed: () {
                      validate();
                    },
                    borderRadius: 20,
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
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
                        fontSize: Get.width * 0.04,
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
                const googleButton(),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        color: AppColors.grey,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.medium,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/signup');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: Get.width * 0.04,
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
      ),
    );
  }
}
