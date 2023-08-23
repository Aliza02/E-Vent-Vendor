import 'package:eventually_vendor/screens/AddService/addService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/BottomNavBar/bottomNavBar.dart';
import '../ManageAvailability/manageAvailability.dart';
import '../dashboard/dashboard.dart';
import '../profile/profile.dart';

class MainScreen extends GetView<testController> {
  MainScreen({
    super.key,
  });

  final pagecontroller = Get.put(testController());

  final List<Widget> _pages = [
    dashboard(),
    const pageTwo(),
    AddService(),
    manageAvailability(),
    profileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Settings', 'Switch Account', 'Logout'];
    return SafeArea(
      child: Obx(
        () => Scaffold(
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
                size: Get.width * 0.1,
                weight: Get.width * 0.1,
              ),
            ),
            actions: [
              pagecontroller.currentindex.value == 0
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: AppColors.pink,
                        size: 30,
                      ),
                    )
                  : const SizedBox(),
              pagecontroller.currentindex.value == 4
                  ? PopupMenuButton(
                      icon: SvgPicture.asset(AppIcons.profileMenuIcon),
                      color: AppColors.cream,
                      itemBuilder: (BuildContext context) {
                        return options.map((String option) {
                          return PopupMenuItem(
                            onTap: () {
                              print(options.indexOf(option));
                            },
                            child: Text(option),
                          );
                        }).toList();
                      },
                    )
                  : Container(),
            ],
          ),
          body: Obx(
            () => _pages[pagecontroller.currentindex.value],
          ),
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
