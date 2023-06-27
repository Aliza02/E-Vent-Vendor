import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/pagecontroller.dart';
import '../../widget/Orders/order_Card.dart';

class toComplete extends StatelessWidget {
  toComplete({super.key});
  final pagecontroller = Get.put(testController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            pagecontroller.orderTabs.value = false;
            print('ada');
            Get.toNamed('/orderDetails');
          },
          child: order_card(),
        );
      },
    );
  }
}
