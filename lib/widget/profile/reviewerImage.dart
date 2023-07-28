import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controller/pagecontroller.dart';

class reviewerImage extends StatelessWidget {
  int index;
  reviewerImage({super.key, required this.index});
  final pagecontroller = Get.put(testController());
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.02),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * 0.025,
        vertical: Get.height * 0.01,
      ),
      width: Get.width * 0.1,
      height: Get.height * 0.05,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Get.width * 0.02),
        child: Image.asset('assets/images/food.png'),
        // child: Image.file(
        //   pagecontroller.selectedImage[index],
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
