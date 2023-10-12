import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class finances extends StatefulWidget {
  const finances({super.key});

  @override
  State<finances> createState() => _financesState();
}

List<String> orderNo = [];
List<String> price = [];
double totalAmount = 0.0;
bool isloading = false;

Future<void> getPrice() async {
  orderNo.clear();
  price.clear();
  totalAmount = 0.0;
  String id = '';
  isloading = true;
  await FirebaseFirestore.instance.collection('Orders').get().then((value) {
    value.docs.forEach((element) {
      if (element.id.contains(auth.currentUser!.uid)) {
        id = element.id;
      }
    });
  });

  await FirebaseFirestore.instance
      .collection('Orders')
      .doc(id)
      .collection('bookings')
      .get()
      .then((value) {
    value.docs.forEach((element) {
      orderNo.add(element.data()['Order No']);
      price.add(element.data()['Service Price']);

      if (element.data()['Service Price'].toString().contains('-')) {
        List<String> parts =
            element.data()['Service Price'].toString().split('-');
        double part1 = double.parse(parts[0]);
        double part2 = double.parse(parts[1]);
        double price = (part1 + part2) / 2;
        totalAmount += price;
      } else {
        totalAmount += int.parse(element.data()['Service Price'].toString());
      }
    });
  });
  isloading = false;
}

class _financesState extends State<finances> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.3),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
          ),
        ),
        body: FutureBuilder(
            future: getPrice(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.14,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.appBar.withOpacity(0.3),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Get.width * 0.1),
                        child: Text(
                          'Finances',
                          style: TextStyle(
                              color: AppColors.pink,
                              fontSize: Get.width * 0.07,
                              fontFamily: AppFonts.manrope,
                              fontWeight: AppFonts.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(
                          top: Get.height * 0.07,
                          left: Get.width * 0.07,
                        ),
                        width: Get.width * 0.86,
                        height: Get.height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Get.width * 0.06),
                          border: Border.all(
                            color: AppColors.googleButtonBorder,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          children: [
                            text(
                              title: 'Total Amount',
                              fontSize: Get.width * 0.055,
                              fontWeight: AppFonts.bold,
                              fontColor: AppColors.grey,
                            ),
                            Spacer(),
                            text(
                              title: "Rs${totalAmount}",
                              fontSize: Get.width * 0.05,
                              fontWeight: AppFonts.extraBold,
                              fontColor: AppColors.pink,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isloading == false
                      ? Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: orderNo.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.01,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: Get.width * 0.07,
                                          top: Get.height * 0.01,
                                        ),
                                        child: text(
                                            title:
                                                "Order No :${orderNo[index]}",
                                            fontSize: Get.width * 0.05,
                                            fontWeight: AppFonts.bold,
                                            fontColor: AppColors.grey),
                                      ),
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: Get.width * 0.07,
                                          top: Get.height * 0.01,
                                        ),
                                        child: text(
                                            title: "${price[index]}",
                                            fontSize: Get.width * 0.05,
                                            fontWeight: AppFonts.bold,
                                            fontColor: AppColors.pink),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      : const SpinKitFadingCircle(
                          color: AppColors.pink,
                        )
                ],
              );
            }),
      ),
    );
  }
}
