import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/widget/AddEditServices/serviceCardText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../firebaseMethods/userAuthentication.dart';

class ServiceCardDetails extends StatelessWidget {
  final String serviceName;
  final String serviceDesc;
  final String priceRange;
  final String noOfperson;
  ServiceCardDetails(
      {super.key,
      required this.serviceName,
      required this.serviceDesc,
      required this.priceRange,
      required this.noOfperson});

  final CollectionReference user = FirebaseFirestore.instance
      .collection('Services')
      .doc(auth.currentUser!.uid)
      .collection(auth.currentUser!.displayName.toString());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.59,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.01),
            child: ServiceCardText(
              text: serviceName,
              fontSize: Get.width * 0.05,
              fontColor: AppColors.grey,
              fontWeight: AppFonts.semiBold,
              opacity: 1.0,
            ),
          ),
          ServiceCardText(
              text: serviceDesc,
              fontSize: Get.width * 0.03,
              fontColor: AppColors.grey,
              fontWeight: AppFonts.medium,
              opacity: 1.0),
          // description

          Row(
            children: [
              ServiceCardText(
                text: "Rs ${priceRange}",
                fontSize: Get.width * 0.04,
                fontColor: AppColors.pink,
                fontWeight: AppFonts.extraBold,
                opacity: 1.0,
              ),
              //
              const Spacer(),
              ServiceCardText(
                text: "${noOfperson} person",
                fontSize: Get.width * 0.025,
                fontColor: AppColors.grey,
                fontWeight: AppFonts.regular,
                opacity: 0.8,
              ),
            ],
          ),

          // ServiceCardText(
          //   text: 'Customized',
          //   fontSize: Get.width * 0.03,
          //   fontColor: AppColors.grey,
          //   fontWeight: AppFonts.regular,
          //   opacity: 0.8,
          // ),
        ],
      ),
    );
  }
}
