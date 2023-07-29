import 'package:flutter/material.dart';
import 'package:eventually_vendor/models/onboardpage_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../constants/images.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  int currentindex = 0;
  PageController? _pagescontroller;

  @override
  void initState() {
    super.initState();
    _pagescontroller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pagescontroller!.dispose();
    super.dispose();
  }

  _storedonBoaredInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('onboard', isViewed);
  }

  Container buildDot(int index, BuildContext context, Color color) {
    return Container(
      width: Get.width * 0.03,
      height: Get.height * 0.015,
      margin: EdgeInsets.all(Get.width * 0.008),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width),
        color: currentindex == index
            ? AppColors.pageIndicator[index]
            : AppColors.inactivePage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          controller: _pagescontroller,
          itemCount: content.length,
          onPageChanged: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Get.width * 0.41),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(
                          content.length,
                          (index) => buildDot(
                              index, context, AppColors.pageIndicator[index]),
                        ),
                      ),
                      currentindex < content.length - 1
                          ? Container(
                              margin: EdgeInsets.only(left: Get.width * 0.2),
                              padding: EdgeInsets.all(Get.width * 0.01),
                              child: TextButton(
                                onPressed: () async {
                                  await _storedonBoaredInfo();
                                  _pagescontroller?.jumpToPage(2);
                                },
                                child: Text(
                                  'skip',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: AppFonts.manrope,
                                    fontSize: Get.width * 0.05,
                                  ),
                                ),
                              ))
                          : Container(
                              height: Get.height * 0.01,
                              width: Get.width * 0.03,
                              margin: EdgeInsets.only(top: Get.width * 0.1),
                              padding: EdgeInsets.all(Get.width * 0.01),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.01),
                  child: Image.asset(
                    content[index].image,
                    height: Get.height * 0.4,
                    width: Get.width * 0.9,
                  ),
                ),
                Container(
                  height: Get.height * 0.17,
                  margin: EdgeInsets.only(top: Get.height * 0.1),
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.13),
                  alignment: Alignment.center,
                  child: Text(
                    content[index].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.signika,
                      color: AppColors.grey,
                      fontSize: Get.width * 0.05,
                    ),
                  ),
                ),
                currentindex == content.length - 1
                    ? Container(
                        width: Get.width * 0.7,
                        height: Get.height * 0.08,
                        margin: EdgeInsets.only(top: Get.height * 0.02),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.pageIndicator[2],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onPressed: () async {
                            await _storedonBoaredInfo();
                            Get.toNamed('/login');
                          },
                          child: Text(
                            'Get Your First Order',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontFamily: AppFonts.signika,
                              fontSize: Get.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: Get.height * 0.02),
                        alignment: Alignment.center,
                        height: Get.height * 0.1,
                        width: Get.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width),
                          color: AppColors.pageIndicator[currentindex],
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            await _storedonBoaredInfo();
                            _pagescontroller?.nextPage(
                                duration: const Duration(milliseconds: 10),
                                curve: Curves.bounceOut);
                          },
                          child: Center(
                            child: Image.asset(
                              AppImages.arrow,
                              width: Get.width * 0.6,
                              height: Get.height * 0.1,
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
