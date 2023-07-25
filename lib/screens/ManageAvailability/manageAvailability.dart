import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../widget/manageAvailability/header.dart';

class manageAvailability extends StatelessWidget {
  manageAvailability({super.key});

  final pagecontroller = Get.put(testController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  text(
                    title: 'Ongoing',
                    fontSize: Get.width * 0.06,
                    fontWeight: AppFonts.bold,
                    fontColor: AppColors.grey,
                  ),
                  const Spacer(),
                  button(
                    label: 'Make Unavailable',
                    onpressed: () {
                      Get.toNamed('/makeUnavailable');
                    },
                    borderRadius: 10,
                  ),
                ],
              ),
            ),
            Obx(
              () => Text(pagecontroller.datesInCurrentMonth.toString()),
            ),
          ],
        ),
      ),
    );
  }
}