import 'package:eventually_vendor/screens/Orders/order_details.dart';
import 'package:eventually_vendor/screens/Orders/order_screens.dart';
import 'package:eventually_vendor/screens/drawer/drawerScreen.dart';
import 'package:eventually_vendor/screens/forgot_password.dart';
import 'package:eventually_vendor/screens/login.dart';
import 'package:eventually_vendor/screens/onboard.dart';
import 'package:eventually_vendor/screens/otp_verification.dart';
import 'package:eventually_vendor/screens/password_reset.dart';
import 'package:eventually_vendor/screens/signup.dart';
import 'package:eventually_vendor/screens/signup_business.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'screens/EditService/EditServiceForm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/drawer',
      getPages: [
        GetPage(
          name: '/onboard',
          page: () => const onboard(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/login',
          page: () => const login(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/signup',
          page: () => const signup(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/otpverification',
          page: () => otp_verification(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/forgetpassword',
          page: () => const forgotPassword(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/signup_business',
          page: () => const signup_business(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/passwordreset',
          page: () => const passwrordReset(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/drawer',
          page: () => drawerScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/editServiceForm',
          page: () => const EditServiceForm(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/order',
          page: () => Orders(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/orderDetails',
          page: () => order_details(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
      initialRoute: '/drawer',
    );
  }
}
