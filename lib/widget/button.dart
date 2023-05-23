import 'package:eventually_vendor/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';
import '../constants/font.dart';

class button extends StatelessWidget {
  String label;

  Function onpressed;
  button({required this.label, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () => onpressed(),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: manrope,
          fontWeight: semiBold,
          fontSize: width * 0.04,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 10.0,
        shadowColor: AppColors.pink.withOpacity(0.4),
        backgroundColor: AppColors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
