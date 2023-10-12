import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:eventually_vendor/widget/button.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';

import '../../firebaseMethods/addService.dart';
import '../../widget/manageAvailability/header.dart';

class manageAvailability extends StatelessWidget {
  manageAvailability({super.key});
  final pagecontroller = Get.put(testController());
  final orderController = Get.put(OrderController());
  int orderColorIndex = 0;

  List<String> orderNo = [];
  List<String> customerName = [];
  List<String> startTime = [];
  List<String> endTime = [];
  List<String> serviceName = [];
  bool isloading = false;

  Future<void> getOrderDetails() async {
    orderNo.clear();
    customerName.clear();
    startTime.clear();
    endTime.clear();
    serviceName.clear();
    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        // print(element.id);
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(orderController.userOrderDocId.value)
        .collection('bookings')
        .where('status', isEqualTo: 'active')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Timestamp firestoreTimestamp = element.data()['Date of Delivery'];

        DateTime dateTime = firestoreTimestamp.toDate();

        // print("${dateTime.day}-${dateTime.month}-${dateTime.year}");
        // print(pagecontroller.getDateForOrders.value);

        if (dateTime.day == pagecontroller.getDateForOrders.value.day &&
            dateTime.month == pagecontroller.getDateForOrders.value.month &&
            dateTime.year == pagecontroller.getDateForOrders.value.year) {
          print('hello');
          isloading = true;
          // pagecontroller.hasOrder.value = true;
          orderNo.add(element.data()['Order No']);
          customerName.add(element.data()['Customer Name']);
          startTime.add(element.data()['Start time']);
          endTime.add(element.data()['End time']);
          serviceName.add(element.data()['Service Name']);
        }
      });
    });

    isloading = false;

    if (orderNo.isEmpty) {
      pagecontroller.hasOrder.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            header(getResultFromFuture: getOrderDetails()),
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
            Expanded(
              child: SizedBox(
                width: Get.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Obx(() => pagecontroller.hasOrder.value == true
                      ? FutureBuilder(
                          future: getOrderDetails(),
                          builder: (context, snapshot) {
                            return isloading == true
                                ? const SpinKitFadingCircle(
                                    color: AppColors.pink,
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: orderNo.length,
                                    itemBuilder: (context, index) {
                                      if (orderColorIndex > 2) {
                                        orderColorIndex = 0;
                                      }
                                      return Row(
                                        children: [
                                          text(
                                            title: serviceName[index],
                                            fontSize: Get.width * 0.04,
                                            fontWeight: AppFonts.regular,
                                            fontColor: AppColors.grey,
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.02,
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: Get.height * 0.01,
                                              ),
                                              padding: EdgeInsets.only(
                                                top: Get.height * 0.01,
                                                left: Get.width * 0.015,
                                              ),
                                              // height: Get.height * 0.1,
                                              decoration: BoxDecoration(
                                                color: AppColors.orderColors[
                                                    orderColorIndex++],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  text(
                                                    title:
                                                        "Order Number: ${orderNo[index]}",
                                                    fontSize: Get.width * 0.04,
                                                    fontWeight: AppFonts.bold,
                                                    fontColor: AppColors.white,
                                                  ),
                                                  text(
                                                    title: customerName[index],
                                                    fontSize: Get.width * 0.025,
                                                    fontWeight: AppFonts.bold,
                                                    fontColor: AppColors.white,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.02,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                            height: Get.height *
                                                                0.05),
                                                        CircleAvatar(
                                                          radius: 12.0,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/images/profileimage.png'),
                                                        ),
                                                        SizedBox(
                                                            width: Get.width *
                                                                0.01),
                                                        text(
                                                          title: customerName[
                                                              index],
                                                          fontSize:
                                                              Get.width * 0.034,
                                                          fontWeight:
                                                              AppFonts.regular,
                                                          fontColor:
                                                              AppColors.white,
                                                        ),
                                                        const Spacer(),
                                                        text(
                                                            title:
                                                                "${startTime[index]}-${endTime[index]}",
                                                            fontSize:
                                                                Get.width *
                                                                    0.034,
                                                            fontWeight: AppFonts
                                                                .regular,
                                                            fontColor: AppColors
                                                                .white),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                          })
                      : Center(
                          child: Text(
                          "You have No order for this date",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontFamily: AppFonts.manrope,
                            fontSize: Get.width * 0.05,
                          ),
                        ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
