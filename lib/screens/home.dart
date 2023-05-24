import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final drawerCOntroller = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZoomDrawer(
          controller: drawerCOntroller,
          style: DrawerStyle.style2,
          menuScreen: MenuScreen(),
          mainScreen: MainScreen(
            drawerController: drawerCOntroller,
          ),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          menuBackgroundColor: AppColors.cream,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}

class MainScreen extends StatelessWidget {
  final drawerController;
  MainScreen({super.key, this.drawerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        title: Text('Home'),
        leading: InkWell(
            onTap: () => drawerController.toggle!(), child: Icon(Icons.menu)),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
