import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controller/pagecontroller.dart';

class buildImage extends StatelessWidget {
  int index;
  buildImage({super.key, required this.index});
  final pagecontroller = Get.put(testController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.02),
        boxShadow: [
          BoxShadow(
            color: AppColors.pink.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 10.0,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      width: Get.width * 0.25,
      height: Get.height * 0.13,
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
