import 'package:eventually_vendor/widget/manageAvailability/heading.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';

class header extends StatefulWidget {
  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  ScrollController scrollController = ScrollController();
  final pagecontroller = Get.put(testController());
  void scroll(double position) {
    scrollController.jumpTo(position);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => scroll(70 * pagecontroller.currentDateIndex.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> datesInCurrentMonth = [];
    pagecontroller.daysInMonth.value = DateTime(pagecontroller.date.value.year,
            pagecontroller.date.value.month + 1, 0)
        .day;

    for (int day = 1; day <= pagecontroller.daysInMonth.value; day++) {
      DateTime date = DateTime(
          pagecontroller.date.value.year, pagecontroller.date.value.month, day);
      pagecontroller.datesInCurrentMonth.add(date);

      // print(datesInCurrentMonth.length);
    }
    pagecontroller.currentDateIndex.value = DateTime.now().day.toDouble();

    Map<int, String> weekdays = {
      1: 'Mon',
      2: 'Tues',
      3: 'Wed',
      4: 'Thurs',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun',
    };

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
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_outlined,
                      size: 20,
                    ),
                    Obx(
                      () => text(
                        title: pagecontroller.date.value.month == 1
                            ? months[pagecontroller.date.value.month + 11]
                                .toString()
                            : months[pagecontroller.date.value.month - 1]
                                .toString(),
                        fontSize: Get.width * 0.035,
                        fontWeight: AppFonts.regular,
                        fontColor: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Obx(
                  () => text(
                    title: months[pagecontroller.date.value.month].toString(),
                    fontSize: Get.width * 0.1,
                    fontWeight: AppFonts.bold,
                    fontColor: AppColors.grey,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final selected = await showMonthPicker(
                      context: context,
                      initialDate: pagecontroller.date.value,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2035),
                    );

                    if (selected != null) {
                      pagecontroller.datesInCurrentMonth.clear();
                      pagecontroller.date.value = selected;
                      pagecontroller.daysInMonth.value = DateTime(
                              pagecontroller.date.value.year,
                              pagecontroller.date.value.month + 1,
                              0)
                          .day;
                      for (int day = 1;
                          day <= pagecontroller.daysInMonth.value;
                          day++) {
                        DateTime date = DateTime(pagecontroller.date.value.year,
                            pagecontroller.date.value.month, day);
                        pagecontroller.datesInCurrentMonth.add(date);
                      }
                    }
                  },
                  child: SvgPicture.asset(AppIcons.calendar),
                ),
                const Spacer(),
                Row(
                  children: [
                    Obx(
                      () => text(
                        title: pagecontroller.date.value.month == 12
                            ? months[pagecontroller.date.value.month - 11]
                                .toString()
                            : months[pagecontroller.date.value.month + 1]
                                .toString(),
                        fontSize: Get.width * 0.035,
                        fontWeight: AppFonts.regular,
                        fontColor: AppColors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Obx(
              () => Row(
                children: List.generate(
                  pagecontroller.datesInCurrentMonth.length,
                  (index) {
                    DateTime date = pagecontroller.datesInCurrentMonth[index];
                    // pagecontroller.date.value = datesInCurrentMonth[index];
                    print(date.day);

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
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
