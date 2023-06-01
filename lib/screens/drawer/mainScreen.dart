import 'package:eventually_vendor/screens/AddService/addService.dart';
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
import '../../widget/BottomNavBar/bottomNavBar.dart';

class MainScreen extends GetView<testController> {
  MainScreen({
    super.key,
  });

  final pagecontroller = Get.put(testController());

  final List<Widget> _pages = [
    AddService(),
    pageTwo(),
    pageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              size: width * 0.1,
              weight: width * 0.1,
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
