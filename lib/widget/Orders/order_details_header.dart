import 'package:eventually_vendor/widget/Orders/Order_Card_Text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import 'order_heading.dart';

class order_Details_Header extends StatelessWidget {
  order_Details_Header({super.key});
  List<String> statusLabel = [
    'Order \n Pending',
    'Order \n Complete',
    'Payment \n Pending',
    'Payment \n Recieved'
  ];
  int indec = 0;
  Container progressBar(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      width: Get.width * 0.2,
      height: Get.height * 0.015,
      decoration: BoxDecoration(
        color:
            index == indec ? AppColors.pink : AppColors.grey.withOpacity(0.33),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Text statusText(BuildContext context, int index) {
    return Text(
      statusLabel[index],
      textAlign: TextAlign.center,
      style: TextStyle(
        color:
            index == indec ? AppColors.grey : AppColors.grey.withOpacity(0.3),
        fontWeight: AppFonts.extraBold,
        fontFamily: AppFonts.manrope,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.23,
          decoration: BoxDecoration(
            color: AppColors.appBar.withOpacity(0.2),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // back button
            Container(
              alignment: Alignment.topLeft,
              height: Get.height * 0.035,
              margin: const EdgeInsets.all(10.0),
              child: IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.grey,
                ),
              ),
            ),
            // order detail heading
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: order_heading(
                title: 'Orders Details',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: order_card_text(
                text: 'Order # 1234',
                fontColor: AppColors.grey,
                fontSize: Get.width * 0.04,
              ),
            ),

            Container(
              width: Get.width * 0.9,
              height: Get.height * 0.15,
              margin: EdgeInsets.only(top: Get.height * 0.02),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColors.pink.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                          top: Get.height * 0.016,
                          left: Get.width * 0.02,
                        ),
                        child: Text(
                          'Order Status',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: Get.width * 0.045,
                            fontFamily: AppFonts.manrope,
                            fontWeight: AppFonts.extraBold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => progressBar(context, index),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => statusText(context, index),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
