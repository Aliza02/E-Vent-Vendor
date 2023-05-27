import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';

class MainScreen extends GetView<testController> {
  MainScreen({
    super.key,
  });

  final pagecontroller = Get.put(testController());

  final List<Widget> _pages = [
    pageOne(),
    pageTwo(),
    pageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavBar(),
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.2),
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)?.toggle();
            },
            child: Icon(
              Icons.menu,
              color: AppColors.pink,
              size: 40.0,
              weight: 10.0,
            ),
          ),
        ),
        body: Obx(
          () => _pages[pagecontroller.currentindex.value],
        ),
      ),
    );
  }
}

class pageOne extends StatelessWidget {
  const pageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('page one'),
    );
  }
}

class pageTwo extends StatelessWidget {
  const pageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Page Two'),
    );
  }
}

class pageThree extends StatelessWidget {
  const pageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Page three'),
    );
  }
}

class bottomNavBar extends GetView<testController> {
  bottomNavBar({super.key});
  final pagecontroller = Get.put(testController());
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.pink,
                width: 2.0,
              ),
            ),
            gradient: LinearGradient(
                transform: GradientRotation(0.0),
                colors: [
                  AppColors.screenBackground.withOpacity(0.1),
                  AppColors.pink.withOpacity(0.2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(0);
                      print(pagecontroller.currentindex.value);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex == 0
                          ? SvgPicture.asset(AppIcons.homeFill)
                          : SvgPicture.asset(AppIcons.home),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(1);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex == 1
                          ? SvgPicture.asset(AppIcons.messageFill)
                          : SvgPicture.asset(AppIcons.message),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(2);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex == 2
                          ? SvgPicture.asset(AppIcons.addButtonFill)
                          : SvgPicture.asset(AppIcons.addButton),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(3);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex == 3
                          ? SvgPicture.asset(AppIcons.calendarFill)
                          : SvgPicture.asset(AppIcons.calender),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(4);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex == 4
                          ? SvgPicture.asset(AppIcons.profileFill)
                          : SvgPicture.asset(AppIcons.profile),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
