import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../controller/pagecontroller.dart';
import 'Order_Card_Text.dart';

class order_card extends StatelessWidget {
  order_card({super.key});
  final pagecontroller = Get.put(testController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width * 0.85,
        height: Get.height * 0.15,
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.015),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.pink.withOpacity(0.25),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/food.png',
                width: Get.width * 0.28,
                height: Get.height * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: Get.width * 0.56,
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  order_card_text(
                      text: 'Order Number:1234',
                      fontColor: AppColors.pink,
                      fontSize: Get.width * 0.04),
                  order_card_text(
                      text: 'Shadi package',
                      fontColor: AppColors.grey,
                      fontSize: Get.width * 0.04),
                  SizedBox(height: Get.height * 0.02),
                  order_card_text(
                      text: 'Fahim Khan',
                      fontColor: AppColors.grey,
                      fontSize: Get.width * 0.03),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      order_card_text(
                        text: '9:00 pm - 12:00 pm',
                        fontColor: AppColors.grey,
                        fontSize: Get.width * 0.03,
                      ),
                      Spacer(),
                      order_card_text(
                        text: 'Rs 60,000',
                        fontColor: AppColors.pink,
                        fontSize: Get.width * 0.03,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
