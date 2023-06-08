import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class swipeableButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonIcon;
  const swipeableButton(
      {super.key, required this.buttonColor, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('test');
      },
      child: Container(
        width: Get.width * 0.17,
        height: Get.height * 0.08,
        margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.04),
          color: buttonColor,
        ),
        child: SvgPicture.asset(
          buttonIcon,
          height: Get.height * 0.035,
          width: Get.width * 0.01,
        ),
      ),
    );
  }
}
