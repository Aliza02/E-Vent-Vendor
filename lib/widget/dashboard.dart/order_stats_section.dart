import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/widget/manageAvailability/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import 'individual_order_stat.dart';

class order_stats_section extends StatefulWidget {
  order_stats_section({super.key});

  @override
  State<order_stats_section> createState() => _order_stats_sectionState();
}

class _order_stats_sectionState extends State<order_stats_section> {
  final orderController = Get.put(OrderController());
  final pagecontroller = Get.put(testController());

  // AggregateQuerySnapshot count = ;
  int docCount = 0;
  String docId = '';

  late Future<int> activeOrdersCount;
  late Future<int> completedOrdersCount;
  Future<int> activeOrders() async {
    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });
    if (orderController.userOrderDocId.value.isEmpty) {
      return 0;
    } else {
      CollectionReference activeOrderReference = await FirebaseFirestore
          .instance
          .collection('Orders')
          .doc(orderController.userOrderDocId.value)
          .collection('bookings');
      QuerySnapshot querySnapshot =
          await activeOrderReference.where('status', isEqualTo: 'active').get();
      // completedOrders();
      return querySnapshot.size;
    }
  }

  Future<int> completedOrders() async {
    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });
    if(orderController.userOrderDocId.value.isEmpty){
      return 0;
    }
    CollectionReference completeOrdersRefdrence = await FirebaseFirestore
        .instance
        .collection('Orders')
        .doc(orderController.userOrderDocId.value)
        .collection('bookings');
    QuerySnapshot querySnapshot = await completeOrdersRefdrence
        .where('status', isEqualTo: 'Completed')
        .get();
    return querySnapshot.size;
  }

  @override
  void initState() {
    activeOrdersCount = activeOrders();
    completedOrdersCount = completedOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      // height: Get.height * 0.3,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3FF77000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          // SizedBox(height: Get.height * 0.012),
          Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.014),
            child: text(
              title: 'Orders Stats',
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
              fontColor: AppColors.grey,
            ),
          ),
          // SizedBox(height: Get.height * 0.006),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder(
                  future: activeOrdersCount,
                  builder: (context, snapshot) {
                    return individual_order_stat(
                      gradientColor1: AppColors.gradientColor1[0],
                      gradientColor2: AppColors.gradientColor2[0],
                      overlapContainerColor: AppColors.overlapContainerColor[0],
                      noOfOrder: snapshot.data.toString(),
                      status: 'Orders Pending',
                    );
                  }),
              FutureBuilder(
                  future: completedOrdersCount,
                  builder: (context, snapshot) {
                    return individual_order_stat(
                      gradientColor1: AppColors.gradientColor1[1],
                      gradientColor2: AppColors.gradientColor2[1],
                      overlapContainerColor: AppColors.overlapContainerColor[1],
                      noOfOrder: snapshot.data.toString(),
                      status: 'Orders Completed',
                    );
                  }),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              individual_order_stat(
                gradientColor1: AppColors.gradientColor1[2],
                gradientColor2: AppColors.gradientColor2[2],
                overlapContainerColor: AppColors.overlapContainerColor[2],
                noOfOrder: '0',
                status: 'Payment Pending',
              ),
              individual_order_stat(
                gradientColor1: AppColors.gradientColor1[3],
                gradientColor2: AppColors.gradientColor2[3],
                overlapContainerColor: AppColors.overlapContainerColor[3],
                noOfOrder: '0',
                status: 'Payment Completed',
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              pagecontroller.toCompleteActive.value = true;
              await FirebaseFirestore.instance
                  .collection('Orders')
                  .get()
                  .then((value) {
                value.docs.forEach((element) {
                  if (element.id.contains(auth.currentUser!.uid)) {
                    print(element.id);

                    orderController.idToGetOrders.add(element.id);
                  }
                });
              });

              print('asd');

              Get.toNamed('/order');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                  title: 'View All Orders',
                  fontSize: Get.width * 0.035,
                  fontWeight: AppFonts.bold,
                  fontColor: const Color(0xFFF77000),
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.01),
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset(
                    AppIcons.orderStatsArrow,
                    height: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Text('Document Count: ${snapshot.data}');
  }
}
