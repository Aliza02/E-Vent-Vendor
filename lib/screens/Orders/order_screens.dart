import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:eventually_vendor/screens/Orders/to_complete_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/BottomNavBar/bottomNavBar.dart';
import '../../widget/Orders/order_header.dart';
import 'allOrders.dart';
import 'complete_order.dart';

class Orders extends StatelessWidget {
  Orders({super.key});

  final pagecontroller = Get.put(testController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            order_header(),
            Obx(
              () => pagecontroller.toCompleteActive.value == true
                  ? Expanded(
                      child: toComplete(),
                    )
                  : Container(),
            ),
            Obx(
              () => pagecontroller.completeActive.value == true
                  ? Expanded(
                      child: complete_order(),
                    )
                  : Container(),
            ),
            Obx(
              () => pagecontroller.allOrdersActive.value == true
                  ? Expanded(
                      child: All_orders(),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
