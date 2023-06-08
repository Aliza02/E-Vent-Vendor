import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class ActiveButton extends StatelessWidget {
  final String title;
  final String icon;
  final Function activeButton;
  final Color buttonColor;
  const ActiveButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.buttonColor,
      required this.activeButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.38,
      height: Get.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.orangeLight,
            spreadRadius: 0.5,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Get.width * 0.05),
          ),
        ),
        onPressed: () => activeButton,
        icon: SvgPicture.asset(icon),
        label: Text(title),
      ),
    );
  }
}
