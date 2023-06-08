import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import 'mainScreen.dart';
import 'menuScreen.dart';

class drawerScreen extends StatefulWidget {
  const drawerScreen({super.key});

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZoomDrawer(
        mainScreen: MainScreen(),
        menuScreen: MenuScreen(),
        menuBackgroundColor: AppColors.pink,
        showShadow: true,
        style: DrawerStyle.defaultStyle,
        angle: 0.0,
        slideWidth: Get.width * .65,
      ),
    );
  }
}
