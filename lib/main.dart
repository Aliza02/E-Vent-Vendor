// import 'package:eventually_vendor/screens/drawer/home_screen.dart';
import 'package:eventually_vendor/screens/AddService/addService.dart';
import 'package:eventually_vendor/screens/drawer/drawerScreen.dart';
import 'package:eventually_vendor/screens/drawer/mainScreen.dart';

import 'package:eventually_vendor/screens/forgot_password.dart';
// import 'package:eventually_vendor/screens/drawer/drawer.dart';
import 'package:eventually_vendor/screens/login.dart';
import 'package:eventually_vendor/screens/onboard.dart';
import 'package:eventually_vendor/screens/otp_verification.dart';
import 'package:eventually_vendor/screens/password_reset.dart';
import 'package:eventually_vendor/screens/signup.dart';
import 'package:eventually_vendor/screens/signup_business.dart';
import 'package:eventually_vendor/widget/textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/onboard': (context) => onboard(),
          '/login': (context) => login(),
          '/signup': (context) => signup(),
          '/otpverification': (context) => otp_verification(),
          '/signup_business': (context) => signup_business(),
          '/forgotpassword': (context) => forgotPassword(),
          '/passwordReset': (context) => passwrordReset(),
          '/addService': (context) => AddService(),
          '/drawer': (context) => drawerScreen(),
        });
  }
}
