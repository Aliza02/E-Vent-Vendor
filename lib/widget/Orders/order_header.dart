import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import 'active_tab.dart';
import 'inactive_tab.dart';
import 'order_heading.dart';

class order_header extends StatelessWidget {
  order_header({super.key});

  final pagecontroller = Get.put(testController());

  //function to active tabs on order screen

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.23,
          decoration: BoxDecoration(
            color: AppColors.appBar.withOpacity(0.2),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: Get.height * 0.035,
              margin: EdgeInsets.all(10.0),
              child: IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.grey,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.085),
              child: order_heading(
                title: 'Orders',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.02),
              width: Get.width * 0.86,
              height: Get.height * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Get.width * 0.06),
                border: Border.all(
                  color: AppColors.googleButtonBorder,
                  width: 1.0,
                ),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    pagecontroller.toCompleteActive.value == true
                        ? const active_tab(
                            title: 'To Complete',
                          )
                        : inactive_tab(
                            title: 'To Complete',
                            activeTab: () {
                              pagecontroller.toCompleteActive.value = true;
                              pagecontroller.completeActive.value = false;
                              pagecontroller.allOrdersActive.value = false;
                              // activeTab();
                            },
                          ),
                    pagecontroller.completeActive.value == true
                        ? const active_tab(
                            title: 'Completed',
                          )
                        : inactive_tab(
                            title: 'Completed',
                            activeTab: () {
                              pagecontroller.completeActive.value = true;
                              pagecontroller.allOrdersActive.value = false;
                              pagecontroller.toCompleteActive.value = false;
                              // activeTab();
                            },
                          ),
                    pagecontroller.allOrdersActive.value == true
                        ? const active_tab(
                            title: 'All Orders',
                          )
                        : inactive_tab(
                            title: 'All Orders',
                            activeTab: () {
                              pagecontroller.allOrdersActive.value = true;
                              pagecontroller.completeActive.value = false;
                              pagecontroller.toCompleteActive.value = false;
                              // activeTab();
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
