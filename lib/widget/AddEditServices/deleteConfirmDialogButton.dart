import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class dialogButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonTitle;
  dialogButton(
      {super.key, required this.buttonColor, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.24,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.03),
            )),
        child: Text(
          buttonTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
