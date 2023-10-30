import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/constants/icons.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:eventually_vendor/screens/ManageAvailability/makeOtherDayUnavailable.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:eventually_vendor/widget/manageAvailability/heading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../widget/manageAvailability/dropDownField.dart';

class makeUnavailable extends StatefulWidget {
  const makeUnavailable({super.key});

  @override
  State<makeUnavailable> createState() => _makeUnavailableState();
}

class _makeUnavailableState extends State<makeUnavailable> {
  @override
  Widget build(BuildContext context) {
    final pageController = Get.put(testController());

    Map<int, String> months = {
      1: 'Jan',
      2: 'Feb',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'Aug',
      9: 'Sept',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec',
    };
    final orderController = Get.put(OrderController());

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading(title: 'Make Unavailable'),
            Row(
              children: [
                Obx(
                  () => text(
                    title:
                        '${months[pageController.date.value.month]} ${pageController.date.value.day}, ${pageController.date.value.year}',
                    fontSize: Get.width * 0.05,
                    fontWeight: AppFonts.bold,
                    fontColor: AppColors.grey,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: pageController.date.value,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );
                    if (date != null) {
                      pageController.date.value = date;
                      orderController.unavailabilityDate.value =
                          "${pageController.date.value.day}-${pageController.date.value.month}-${pageController.date.value.year}";
                    }
                  },
                  child: SvgPicture.asset(AppIcons.calendar),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.05),
              child: text(
                title: 'Time Duration',
                fontSize: Get.width * 0.04,
                fontWeight: AppFonts.regular,
                fontColor: AppColors.grey,
              ),
            ),
            dropdownField(hintText: 'Start Time', icon: AppIcons.startFlag),
            dropdownField(hintText: 'End Time', icon: AppIcons.endFlag),
            Center(
                child: button(
                    label: 'Unavailable',
                    onpressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text(
                              'Do you want to make this time unavailable?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('User')
                                    .doc(auth.currentUser!.uid)
                                    .set({
                                  'unavailable': "true",
                                  'unavailable Date':
                                      orderController.unavailabilityDate.value,
                                  'unavailable start time':
                                      orderController.unavailabilityTime[0],
                                  'unavailable end time':
                                      orderController.unavailabilityTime[1],
                                }, SetOptions(merge: true));
                                Get.to(() => makeOtherDayUnavailable());
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    borderRadius: 10.0))
          ],
        ),
      ),
    ));
  }
}
