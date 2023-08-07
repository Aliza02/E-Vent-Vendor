import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class textFormField extends StatelessWidget {
  textFormField({
    super.key,
    required this.textController,
    required this.inputtype,
    required this.enabledField,
    required this.maxLines,
  });

  TextEditingController textController = TextEditingController();
  TextInputType inputtype;
  bool enabledField;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.04,
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.appBar.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        enabled: enabledField,
        controller: textController,
        keyboardType: inputtype,
        maxLines: maxLines,
        cursorColor: AppColors.pink,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5.0),
          // isCollapsed: true,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            borderSide: const BorderSide(
              color: AppColors.appBar,
              width: 0.3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            borderSide: const BorderSide(
              color: AppColors.appBar,
              width: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
