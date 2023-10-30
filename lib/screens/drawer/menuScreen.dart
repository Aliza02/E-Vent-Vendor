import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:eventually_vendor/controller/signupController.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/screens/Finances/finances.dart';
import 'package:eventually_vendor/screens/Help_center/help.dart';
import 'package:eventually_vendor/screens/aboutus/aboutus.dart';
import 'package:eventually_vendor/screens/dashboard/dashboard.dart';
import 'package:eventually_vendor/screens/privacyPolicy/privacy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants/icons.dart';
import '../../controller/firebaseController.dart';
import '../../controller/pagecontroller.dart';
import '../../controller/signinController.dart';

class MenuScreen extends GetView<testController> {
  MenuScreen({super.key});
  final pagecontroller = Get.put(testController());
  int currentindex = 0;

  final FirebaseAuth auth = FirebaseAuth.instance;
  // final GoogleSignIn google=GoogleSignIn().signOut()

  final signupcontroller = Get.put(signUpController());
  final signincontroller = Get.put(signinController());
  final firebasecontroller = Get.put(firebaseController());

  // String? userName = auth.currentUser?.displayName;

  // final username=_auth.currentUser!.displayName;

  final List<String> menuItems = [
    // 'Finance',
    'Home',
    'Finances',
    // 'Bank Information',
    // 'Settings',
    // 'Tutorial',
    'Payment Policy',
    'Help Center',
    'About'
  ];

  final List<String> menuIcons = [
    AppIcons.home,
    // AppIcons.idVerification,
    AppIcons.bank,
    // AppIcons.setting,
    // AppIcons.tutorial,
    AppIcons.paymentPolicy,
    AppIcons.helpCenter,
    AppIcons.about,
  ];

  final List<String> menuIconsFilled = [
    AppIcons.homeFill,
    // AppIcons.idVerificationFill,
    AppIcons.bankFill,
    // AppIcons.settingFill,
    // AppIcons.tutorialFill,
    AppIcons.paymentPolicyFill,
    AppIcons.helpCenterFill,
    AppIcons.aboutFill
  ];

  final List<Widget> _drawerPages = [
    dashboard(),
    const finances(),
    privacyPolicy(),
    const Help(),
    const aboutus(),
    // OrdersScreen(),
    // // PaymentMethods(),
    // settings(),
    // profileScreen(),
    // Help(),
  ];

  Widget buildMenuItems(BuildContext context, int index) {
    return Obx(
      () => Container(
        width: Get.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: pagecontroller.indexOfDrawerMenuItems.value == index
                ? AppColors.pink.withOpacity(0.2)
                : Colors.transparent),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.06,
                vertical: Get.width * 0.03,
              ),
              child: pagecontroller.indexOfDrawerMenuItems.value == index
                  ? SvgPicture.asset(menuIconsFilled[index])
                  : SvgPicture.asset(menuIcons[index]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: Text(
                menuItems[index],
                style: TextStyle(
                  color: pagecontroller.indexOfDrawerMenuItems.value == index
                      ? AppColors.pink
                      : AppColors.grey,
                  fontWeight: AppFonts.medium,
                  fontSize: Get.width * 0.034,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cream,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.05),
                  width: Get.height / 8,
                  height: Get.height * 0.12,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.pink.withOpacity(0.6),
                        spreadRadius: 12,
                        blurRadius: 18.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.05),
                  padding: EdgeInsets.all(Get.width * 0.01),
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/images/profileimage.png'),
                    // backgroundImage:firebasecontroller.profileImageLink.value.isNotEmpty?
                    //     NetworkImage(firebasecontroller.profileImageLink.value): Netw
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.02),
              child: Text(
                // 'aa',
                auth.currentUser!.displayName!.toString(),
                style: TextStyle(
                  fontFamily: AppFonts.manrope,
                  fontWeight: AppFonts.extraBold,
                  fontSize: Get.width * 0.05,
                  color: AppColors.grey,
                ),
              ),
            ),
            Text(
              auth.currentUser!.email.toString(),
              style: TextStyle(
                fontSize: Get.width * 0.035,
                fontFamily: AppFonts.manrope,
                fontWeight: AppFonts.medium,
                color: AppColors.grey,
              ),
            ),
            Divider(
              color: AppColors.grey.withOpacity(0.12),
              height: 20.0,
              thickness: 2.0,
            ),
            Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          pagecontroller.indexOfDrawerMenuItems.value = index;
                        },
                        child: GestureDetector(
                            onTap: () {
                              Get.to(() => _drawerPages[index]);
                            },
                            child: buildMenuItems(context, index)),
                      );
                    }),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                GoogleSignIn().signOut();
                Signout();
                signincontroller.emailController.clear();
                signincontroller.passwordController.clear();
                Get.offAllNamed('/login');

                // Get.back();
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.06,
                        vertical: Get.width * 0.07),
                    child: SvgPicture.asset(AppIcons.logout),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.06,
                        vertical: Get.width * 0.07),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: Get.width * 0.04,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
