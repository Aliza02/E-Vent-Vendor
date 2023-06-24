import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';

class dropdownmenu extends StatefulWidget {
  const dropdownmenu({super.key});

  @override
  State<dropdownmenu> createState() => _dropdownmenuState();
}

class _dropdownmenuState extends State<dropdownmenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Color(0xFFFFF6F6),
              items: [
                'Order Placed',
                'Status Modified',
                'Order Delivery',
              ].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: SizedBox(
                    width: 115,
                    height: 20,
                    child: Text(
                      value,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.grey,
                        fontSize: Get.width * 0.04,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
              icon: SvgPicture.asset(
                AppIcons.sort,
                width: 13,
                height: 16,
              ),
              onChanged: (value) {
                if (value != null) {
                  print(value);
                }
              },
            ),
          ),
          SizedBox(width: Get.width * 0.01),
          Text(
            'Sort Date By',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
              fontFamily: AppFonts.manrope,
            ),
          ),
        ],
      ),
    );
  }
}
