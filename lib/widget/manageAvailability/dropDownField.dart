import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';

class dropdownField extends StatefulWidget {
  final String hintText;
  final String icon;
  dropdownField({super.key, required this.hintText, required this.icon});

  @override
  State<dropdownField> createState() => _dropdownFieldState();
}

class _dropdownFieldState extends State<dropdownField> {
  final timmings = [
    '12:00 AM',
    '1:00 AM',
    '2:00 AM',
    '3:00 AM',
    '4:00 AM',
    '5:00 AM',
    '6:00 AM',
    '7:00 AM',
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM',
    '10:00 PM',
    '11:00 PM',
  ];
  var selected;
  TextEditingController timmingsController = TextEditingController();
  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.018),
      child: DropdownButtonFormField(
          dropdownColor: AppColors.pink,
          decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
              widget.icon,
              fit: BoxFit.scaleDown,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: AppFonts.manrope,
            ),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.pink,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.pink,
              ),
            ),
          ),
          items: timmings
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          onChanged: (val) {
            selected = val as String;
            timmingsController.text = selected;
            orderController.unavailabilityTime.add(selected);
          }),
    );
  }
}
