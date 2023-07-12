// import 'package:eventually_vedor/widget/Orders/order_header.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../widget/AddEditServices/buildImage.dart';
import '../../widget/BottomNavBar/bottomNavBar.dart';
import '../../widget/Orders/order_detail_heading.dart';
import '../../widget/Orders/order_detail_text.dart';
import '../../widget/Orders/order_details_header.dart';

class order_details extends StatelessWidget {
  order_details({super.key});
  final pagecontroller = Get.put(testController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(
            () => Column(
              children: [
                order_Details_Header(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.01,
                  ),
                  margin: EdgeInsets.only(
                      top: Get.height * 0.04, bottom: Get.height * 0.02),
                  width: Get.width * 0.9,
                  height: pagecontroller.orderDetailEnable.value == true
                      ? Get.height * 0.69
                      : Get.height * 0.52,
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.pink.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: Get.width * 0.02,
                              top: Get.height * 0.02,
                            ),
                            child: buildImage(index: 0),
                          ),
                          Text(
                            'Shadi package',
                            style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: AppFonts.extraBold,
                              fontFamily: AppFonts.manrope,
                              color: AppColors.grey,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              pagecontroller.orderDetailEnable.value =
                                  !pagecontroller.orderDetailEnable.value;
                            },
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                color: AppColors.pink,
                                fontSize: Get.width * 0.033,
                                fontFamily: AppFonts.manrope,
                                fontWeight: AppFonts.bold,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.pink,
                            size: 13.0,
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Obx(
                        () => pagecontroller.orderDetailEnable.value == true
                            ? Divider(
                                color: AppColors.pink.withOpacity(0.2),
                                height: 20.0,
                                thickness: 2,
                                indent: 9,
                                endIndent: 9,
                              )
                            : Container(),
                      ),
                      Obx(() => pagecontroller.orderDetailEnable.value == true
                          ? Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(left: Get.width * 0.08),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      order_detail_heading(title: 'Details'),
                                      order_detail_text(
                                          title: 'Customer Name', opacity: 0.3),
                                      order_detail_text(
                                          title: 'Order Date', opacity: 0.3),
                                      order_detail_text(
                                          title: 'Due Date', opacity: 0.3),
                                      order_detail_text(
                                          title: 'Time Slot', opacity: 0.3),
                                      order_detail_text(
                                          title: 'Customization', opacity: 0.3),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: Get.width * 0.2,
                                    top: Get.height * 0.02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      order_detail_text(
                                          title: 'ABC', opacity: 1.0),
                                      order_detail_text(
                                          title: '14 May 2023', opacity: 1.0),
                                      order_detail_text(
                                          title: '31 May 2023', opacity: 1.0),
                                      order_detail_text(
                                          title: '9:00PM- 12:00AM',
                                          opacity: 1.0),
                                      order_detail_text(
                                          title: 'dbajsbdasbdha', opacity: 1.0),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container()),
                      Divider(
                        color: AppColors.pink.withOpacity(0.2),
                        height: 20.0,
                        thickness: 2,
                        indent: 9,
                        endIndent: 9,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Get.width * 0.08),
                            child: Column(
                              children: [
                                order_detail_heading(title: 'Payment'),
                                order_detail_text(
                                  title: '11111111',
                                  opacity: 1.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: Get.width * 0.3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                order_detail_heading(title: 'Delivery'),
                                order_detail_text(
                                    title: 'Address', opacity: 0.3),
                                order_detail_text(
                                    title: '280/D unit 6 latifabad',
                                    opacity: 1.0),
                                order_detail_text(
                                    title: 'Method', opacity: 0.3),
                                order_detail_text(
                                  title: 'Free',
                                  opacity: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Divider(
                        color: AppColors.pink.withOpacity(0.2),
                        height: 20.0,
                        thickness: 2,
                        indent: 9,
                        endIndent: 9,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Get.width * 0.08),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                order_detail_heading(title: 'Order Summary'),
                                order_detail_text(
                                    title: 'Sub Total', opacity: 1.0),
                                order_detail_text(
                                    title: 'Advance(20%)', opacity: 0.3),
                                order_detail_text(
                                    title: 'Delivery', opacity: 0.3),
                                order_detail_text(
                                    title: 'Discount', opacity: 0.3),
                                order_detail_text(title: 'Tax', opacity: 0.3),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: Get.width * 0.2, top: Get.height * 0.02),
                            child: Column(
                              children: [
                                order_detail_text(
                                    title: '50,000', opacity: 1.0),
                                order_detail_text(
                                    title: '12,000', opacity: 0.3),
                                order_detail_text(
                                    title: '+ Rs 0', opacity: 0.3),
                                order_detail_text(
                                    title: '- Rs 0', opacity: 0.3),
                                order_detail_text(title: '+ 275', opacity: 0.3),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.pink.withOpacity(0.2),
                        height: 20.0,
                        thickness: 2,
                        indent: 9,
                        endIndent: 9,
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: Get.width * 0.08),
                              child: order_detail_heading(title: 'Total')),
                          Container(
                            margin: EdgeInsets.only(left: Get.width * 0.37),
                            child: order_detail_heading(title: '12908'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
