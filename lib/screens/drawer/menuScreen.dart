import 'dart:ui';

import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/icons.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<String> menuItems = [
    'Payment',
    'Tell a Friend',
    'Settings',
    'Profile',
    'Help Center'
  ];

  List<String> menuIcons = [
    AppIcons.payment,
    AppIcons.share,
    AppIcons.setting,
    AppIcons.Profile,
    AppIcons.helpCenter,
    AppIcons.logout
  ];

  Row buildMenuItems(BuildContext context, int index) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: width * 0.03,
          ),
          child: SvgPicture.asset(menuIcons[index]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Text(
            menuItems[index],
            // textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: medium,
              fontSize: width * 0.034,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.cream,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  width: height / 8,
                  height: height * 0.12,
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
                  margin: EdgeInsets.only(top: height * 0.05),
                  padding: EdgeInsets.all(width * 0.01),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('assets/images/profileimage.png'),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              child: Text(
                'User Name',
                style: TextStyle(
                    fontFamily: manrope,
                    fontWeight: extraBold,
                    fontSize: width * 0.05,
                    color: AppColors.grey),
              ),
            ),
            Container(
              child: Text(
                'abc@gmail.com',
                style: TextStyle(
                  fontFamily: manrope,
                  // fontSize: width * 0.05,
                  fontWeight: medium,
                  color: AppColors.grey,
                ),
              ),
            ),
            Divider(
              color: AppColors.grey.withOpacity(0.12),
              height: 20.0,
              thickness: 2.0,
            ),
            Column(
              children: List.generate(
                menuItems.length,
                (index) => buildMenuItems(context, index),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.06, vertical: width * 0.07),
                  child: SvgPicture.asset(AppIcons.logout),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.06, vertical: width * 0.07),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: AppColors.pink,
                      fontSize: width * 0.04,
                      fontWeight: bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
