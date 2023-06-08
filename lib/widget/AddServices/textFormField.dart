import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class textFormField extends StatelessWidget {
  const textFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.04,
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.lightblue.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            borderSide: const BorderSide(
              color: AppColors.lightblue,
              width: 0.3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            borderSide: const BorderSide(
              color: AppColors.lightblue,
              width: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
