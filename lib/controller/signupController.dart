import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessCategoryController =
      TextEditingController();
  final TextEditingController businessLocationController =
      TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  RxBool NewUser = true.obs;
  User? user;

  //OTP verification

  RxString OTPCode = ''.obs;
  RxInt secondsRemainingforOtp = 50.obs;
  RxBool successfullSignup = false.obs;
}
