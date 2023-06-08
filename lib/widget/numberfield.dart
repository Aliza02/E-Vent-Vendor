import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

class numberField extends StatefulWidget {
  final String title;
  final int maxLength;

  const numberField({super.key, required this.title, required this.maxLength});

  @override
  State<numberField> createState() => _numberFieldState();
}

class _numberFieldState extends State<numberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      cursorColor: AppColors.pink,
      textAlign: widget.maxLength >= 11 ? TextAlign.start : TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: AppColors.fieldFillColor.withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        counterText: "",
        hintStyle: TextStyle(
          fontSize: Get.width * 0.04,
          color: Colors.grey,
          fontFamily: AppFonts.manrope,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          borderSide: const BorderSide(
            color: AppColors.pink,
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          borderSide: const BorderSide(
            color: AppColors.pink,
            width: 1.3,
          ),
        ),
      ),
    );
  }
}
