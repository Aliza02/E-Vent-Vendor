import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';

class MainScreen extends StatefulWidget {
  final drawerController;
  MainScreen({super.key, this.drawerController});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> navBarIcon = [
    AppIcons.home,
    AppIcons.message,
    AppIcons.addButton,
    AppIcons.calender,
    AppIcons.profile
  ];
  bool isOpen = false;
  int currentindex = 0;
  bool selected = false;
  void initstate() {
    super.initState();
  }

  void dispose() {
    super.dispose();
    currentindex = 0;
  }

  final List<Widget> _pages = [
    pageOne(),
    pageTwo(),
    pageThree(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Stack(
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
                      AppColors.pink.withOpacity(0.4),
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
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentindex = 0;
                        });
                      },
                      icon: currentindex == 0
                          ? SvgPicture.asset(AppIcons.homeFill)
                          : SvgPicture.asset(AppIcons.home),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentindex = 1;
                        });
                      },
                      icon: currentindex == 1
                          ? SvgPicture.asset(AppIcons.messageFill)
                          : SvgPicture.asset(AppIcons.message),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentindex = 2;
                        });
                      },
                      icon: currentindex == 2
                          ? SvgPicture.asset(AppIcons.addButtonFill)
                          : SvgPicture.asset(AppIcons.addButton),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentindex = 3;
                        });
                      },
                      icon: currentindex == 3
                          ? SvgPicture.asset(AppIcons.calendarFill)
                          : SvgPicture.asset(AppIcons.calender),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentindex = 4;
                        });
                      },
                      icon: currentindex == 4
                          ? SvgPicture.asset(AppIcons.profileFill)
                          : SvgPicture.asset(AppIcons.profile),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        body: _pages[currentindex],
      ),
    );
  }
}

class pageOne extends StatelessWidget {
  const pageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Page One'),
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
