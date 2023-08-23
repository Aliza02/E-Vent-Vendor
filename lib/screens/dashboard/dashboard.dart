import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../firebaseMethods/addService.dart';
import '../../widget/dashboard.dart/chart.dart';
import '../../widget/dashboard.dart/order_stats_section.dart';
import '../../widget/dashboard.dart/review.dart';
import '../../widget/dashboard.dart/top_orders.dart';
import '../../widget/manageAvailability/text.dart';

class dashboard extends StatefulWidget {
  dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  void initState() {
    final docRef = firestore.collection("User").doc(auth.currentUser!.uid);

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        final business = data['Business Category'];
        servicecontroller.currentUserBusinessCategory.value = business;
        // print(business);
        print(servicecontroller.currentUserBusinessCategory.value);
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
            vertical: Get.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.07),
                child: text(
                  title: "Welcome ${auth.currentUser!.displayName}",
                  fontColor: AppColors.grey,
                  fontSize: Get.width * 0.04,
                  fontWeight: AppFonts.regular,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.07),
                child: text(
                  title: "Your Dashboard",
                  fontColor: AppColors.pink,
                  fontSize: Get.width * 0.08,
                  fontWeight: AppFonts.extraBold,
                ),
              ),
              const chart(), // display chart
              SizedBox(
                height: Get.height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  order_stats_section(),
                  top_orders(),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              review(),
            ],
          ),
        ),
      ),
    );
  }
}
