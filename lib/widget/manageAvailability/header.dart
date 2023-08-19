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
import '../../firebaseMethods/addService.dart';

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

  Future add() async {
    await firestore
        .collection('Orders')
        .doc(auth.currentUser?.uid)
        .collection(auth.currentUser!.displayName.toString())
        .doc('Birthday Package')
        .set(
      {
        'OrderNo': '12445',
        'ServiceName': 'Birthday Package',
        'UserName': 'Aliza',
        'Time': '9:00 AM - 12:00 PM',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    pagecontroller.getMonth.value = pagecontroller.date.value.month;
    print(pagecontroller.getMonth.value);
    print(pagecontroller.date.value.weekday);
    pagecontroller.daysInMonth.value = DateTime(
            pagecontroller.date.value.year, pagecontroller.date.value.month, 0)
        .day;
    for (int day = 1; day <= pagecontroller.daysInMonth.value; day++) {
      DateTime date = DateTime(
          pagecontroller.date.value.year, pagecontroller.date.value.month, day);
      pagecontroller.datesInCurrentMonth.add(date);
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
// function to get number of days of previous and next month
    void getDaysOfMonth() {
      pagecontroller.daysInMonth.value = DateTime(
              pagecontroller.date.value.year,
              pagecontroller.getMonth.value + 1,
              0)
          .day;
      for (int day = 1; day <= pagecontroller.daysInMonth.value; day++) {
        DateTime date = DateTime(
            pagecontroller.date.value.year, pagecontroller.getMonth.value, day);
        pagecontroller.datesInCurrentMonth.add(date);
      }
    }

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
                InkWell(
                  onTap: () async {
                    pagecontroller.getMonth.value--;
                    if (pagecontroller.getMonth.value == 0) {
                      pagecontroller.getMonth.value =
                          pagecontroller.date.value.month;
                    }

                    add();

                    print('success');

                    pagecontroller.datesInCurrentMonth.clear();
                    getDaysOfMonth();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_outlined,
                        size: 20,
                      ),
                      Obx(
                        () => text(
                          title: pagecontroller.getMonth.value == 1
                              ? months[pagecontroller.getMonth.value + 11]
                                  .toString()
                              : months[pagecontroller.getMonth.value - 1]
                                  .toString(),
                          fontSize: Get.width * 0.035,
                          fontWeight: AppFonts.regular,
                          fontColor: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Obx(
                  () => text(
                    title: months[pagecontroller.getMonth.value].toString(),
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
                      pagecontroller.getMonth.value =
                          pagecontroller.date.value.month;

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
                InkWell(
                  onTap: () {
                    pagecontroller.getMonth.value++;
                    if (pagecontroller.getMonth.value > 12) {
                      pagecontroller.getMonth.value =
                          pagecontroller.date.value.month;
                    }

                    pagecontroller.datesInCurrentMonth.clear();

                    getDaysOfMonth();
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => text(
                          title: pagecontroller.getMonth.value == 12
                              ? months[pagecontroller.getMonth.value - 11]
                                  .toString()
                              : months[pagecontroller.getMonth.value + 1]
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
                            // title: date.toString(),
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
