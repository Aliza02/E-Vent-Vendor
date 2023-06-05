import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';

class Label extends StatelessWidget {
  String title;
  Label({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.bottomLeft,
      width: width * 0.87,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: width * 0.04,
          fontFamily: AppFonts.manrope,
          color: AppColors.grey.withOpacity(0.8),
          fontWeight: AppFonts.bold,
        ),
      ),
    );
  }
}
