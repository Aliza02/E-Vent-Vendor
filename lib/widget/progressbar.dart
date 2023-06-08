import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

class progressbar extends StatefulWidget {
  int index = 0;
  progressbar({super.key, required this.index});

  @override
  State<progressbar> createState() => _progressbarState();
}

class _progressbarState extends State<progressbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: Get.height * 0.03,
                  width: Get.width * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.pink,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: widget.index >= 1
                      ? const Icon(
                          Icons.check,
                          color: AppColors.pink,
                          size: 16.0,
                        )
                      : const Icon(
                          Icons.circle,
                          color: AppColors.pink,
                          size: 16.0,
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.003),
                  height: Get.height * 0.001,
                  width: Get.width * 0.6,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: Get.height * 0.03,
                  width: Get.width * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.index == 0 ? Colors.grey : AppColors.pink,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.white,
                  ),
                  child: widget.index >= 1
                      ? const Icon(
                          Icons.circle,
                          color: AppColors.pink,
                          size: 16.0,
                        )
                      : Container(),
                ),
              ],
            ),
            SizedBox(
              width: Get.width * 0.82,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(
                      fontFamily: AppFonts.manrope,
                      fontSize: Get.width * 0.04,
                      fontWeight: widget.index == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Business',
                    style: TextStyle(
                      fontFamily: AppFonts.manrope,
                      fontSize: Get.width * 0.04,
                      fontWeight: widget.index == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
