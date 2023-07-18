import 'package:eventually_vendor/widget/manageAvailability/heading.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';

class header extends StatefulWidget {
  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int currentMonth = now.month;

    List<DateTime> datesInCurrentMonth = [];
    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
    int day = DateTime(currentYear, currentMonth, 1).day;
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(currentYear, currentMonth, day);
      datesInCurrentMonth.add(date);
      print(DateTime(currentYear, currentMonth + 1, now.day));
      print(DateTime.now().day);
    }

    Map<int, String> weekdays = {
      1: 'Mon',
      2: 'Tues',
      3: 'Wed',
      4: 'Thurs',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun',
    };
    return Stack(children: [
      Container(
        height: Get.height * 0.3,
        decoration: BoxDecoration(
          color: AppColors.appBar.withOpacity(0.2),
        ),
      ),
      Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
            child: heading(title: 'Manage Availability'),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_outlined,
                  size: 20,
                ),
                text(
                  title: 'March',
                  fontSize: Get.width * 0.035,
                  fontWeight: AppFonts.regular,
                  fontColor: AppColors.grey,
                ),
                const Spacer(),
                text(
                  title: 'April',
                  fontSize: Get.width * 0.1,
                  fontWeight: AppFonts.bold,
                  fontColor: AppColors.grey,
                ),
                SvgPicture.asset(AppIcons.calendar),
                const Spacer(),
                text(
                  title: 'May',
                  fontSize: Get.width * 0.035,
                  fontWeight: AppFonts.regular,
                  fontColor: AppColors.grey,
                ),
                const Icon(
                  Icons.arrow_forward_outlined,
                  size: 20,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(datesInCurrentMonth.length, (index) {
                DateTime date = datesInCurrentMonth[index];
                return Container(
                  width: Get.width * 0.17,
                  height: Get.height * 0.12,
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.02,
                      vertical: Get.height * 0.015),
                  decoration: ShapeDecoration(
                    color: date.day == DateTime.now().day
                        ? AppColors.pink
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.97),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.googleButtonBorder,
                        blurRadius: Get.width * 0.02,
                        offset: Offset(0, 3.66),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                        title: date.day.toString(),
                        fontSize: Get.width * 0.05,
                        fontWeight: AppFonts.bold,
                        fontColor: date.day == DateTime.now().day
                            ? Colors.white
                            : AppColors.grey,
                      ),
                      text(
                        title: weekdays[date.weekday].toString(),
                        fontSize: Get.width * 0.035,
                        fontWeight: AppFonts.bold,
                        fontColor: date.day == DateTime.now().day
                            ? Colors.white
                            : AppColors.grey,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ]);
  }
}
