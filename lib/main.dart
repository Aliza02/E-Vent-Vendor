import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:eventually_vendor/bindings/all_controller_bindings.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/controller/signinController.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/screens/ManageAvailability/makeOtherDayUnavailable.dart';
import 'package:eventually_vendor/screens/ManageAvailability/makeUnavailable.dart';
import 'package:eventually_vendor/screens/Orders/order_details.dart';
import 'package:eventually_vendor/screens/Orders/order_screens.dart';
import 'package:eventually_vendor/screens/drawer/drawerScreen.dart';
import 'package:eventually_vendor/screens/forgot_password.dart';
import 'package:eventually_vendor/screens/login.dart';
import 'package:eventually_vendor/screens/onboard.dart';
import 'package:eventually_vendor/screens/otp_verification.dart';
import 'package:eventually_vendor/screens/password_reset.dart';
import 'package:eventually_vendor/screens/profile/editProfile.dart';
import 'package:eventually_vendor/screens/profile/profile.dart';
import 'package:eventually_vendor/screens/signup.dart';
import 'package:eventually_vendor/screens/signup_business.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'screens/EditService/EditServiceForm.dart';

bool? isLoggedin;
int? isViewed;
final orderController = Get.put(OrderController());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onboard');
  isLoggedin = prefs.getBool('rememberMe');
 HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final signincontroller = Get.put(signinController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllerBinding(),
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
        GetPage(
          name: '/makeUnavailable',
          page: () => makeUnavailable(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/makeOtherDayUnavailable',
          page: () => const makeOtherDayUnavailable(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/profile',
          page: () => profileScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/editprofile',
          page: () => editProfile(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
      initialRoute: isViewed != 0
          ? '/onboard'
          : isLoggedin == true
              ? '/drawer'
              : '/login',
    );
  }
}
