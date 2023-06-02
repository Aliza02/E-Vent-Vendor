import 'package:eventually_vendor/widget/AddServices/subheading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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

  void activeButton() {
    pagecontroller.EditServiceSelected.value =
        !pagecontroller.EditServiceSelected.value;
    pagecontroller.AddServiceSelected.value =
        !pagecontroller.AddServiceSelected.value;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: height * 0.23,
          decoration: BoxDecoration(
            color: AppColors.appBar.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: serviceHeading(
                title: 'Add Service',
                fontColor: AppColors.pink,
                fontSize: width * 0.07,
                fontFamily: AppFonts.manrope,
                fontWeight: AppFonts.extraBold,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: serviceSubHeading(
                  title:
                      "For adding a service, fill all the filelds and follow the service adding rules",
                  fontColor: AppColors.grey,
                  fontFamily: AppFonts.manrope,
                  fontSize: width * 0.03,
                  fontWeight: AppFonts.bold,
                )),
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              width: width * 0.86,
              height: height * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: AppColors.googleButtonBorder,
                  width: 1.0,
                ),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    pagecontroller.EditServiceSelected.value == false
                        ? InactiveButton(
                            title: 'Edit',
                            icon: AppIcons.editInactive,
                            activeButton: () {
                              activeButton();
                            },
                          )
                        : ActiveButton(
                            activeButton: () {
                              if (pagecontroller.EditServiceSelected.value ==
                                  false) {
                                activeButton();
                              }
                            },
                            icon: AppIcons.editActive,
                            title: 'Edit',
                            buttonColor: AppColors.pink,
                          ),
                    pagecontroller.AddServiceSelected.value == false
                        ? InactiveButton(
                            title: 'Add',
                            icon: AppIcons.addInactive,
                            activeButton: () {
                              activeButton();
                            },
                          )
                        : ActiveButton(
                            activeButton: () {
                              if (pagecontroller.AddServiceSelected.value ==
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
