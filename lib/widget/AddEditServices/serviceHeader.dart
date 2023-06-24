import 'package:eventually_vendor/widget/AddEditServices/subheading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import 'activeButton.dart';
import 'heading.dart';
import 'inactiveButton.dart';

class service_Header extends StatelessWidget {
  service_Header({super.key});

  final pagecontroller = Get.put(testController());
  // function to activate add edit page
  void activeButton() {
    pagecontroller.editServiceSelected.value =
        !pagecontroller.editServiceSelected.value;
    pagecontroller.addServiceSelected.value =
        !pagecontroller.addServiceSelected.value;
  }

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
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              child: serviceHeading(
                title: 'Add Service',
                fontColor: AppColors.pink,
                fontSize: Get.width * 0.07,
                fontFamily: AppFonts.manrope,
                fontWeight: AppFonts.extraBold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
              child: serviceSubHeading(
                title:
                    "For adding a service, fill all the filelds and follow the service adding rules",
                fontColor: AppColors.grey,
                fontFamily: AppFonts.manrope,
                fontSize: Get.width * 0.03,
                fontWeight: AppFonts.bold,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    pagecontroller.editServiceSelected.value == false
                        ? InactiveButton(
                            title: 'Edit',
                            icon: AppIcons.editInactive,
                            activeButton: () {
                              activeButton();
                            },
                          )
                        : ActiveButton(
                            activeButton: () {
                              if (pagecontroller.editServiceSelected.value ==
                                  false) {
                                activeButton();
                              }
                            },
                            icon: AppIcons.editActive,
                            title: 'Edit',
                            buttonColor: AppColors.pink,
                          ),
                    pagecontroller.addServiceSelected.value == false
                        ? InactiveButton(
                            title: 'Add',
                            icon: AppIcons.addInactive,
                            activeButton: () {
                              activeButton();
                            },
                          )
                        : ActiveButton(
                            activeButton: () {
                              if (pagecontroller.addServiceSelected.value ==
                                  false) {
                                activeButton();
                              }
                            },
                            icon: AppIcons.addActive,
                            title: 'Add',
                            buttonColor: AppColors.blue,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
