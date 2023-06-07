import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';

class swipeableButton extends StatelessWidget {
  Color buttonColor;
  String buttonIcon;
  swipeableButton(
      {super.key, required this.buttonColor, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
