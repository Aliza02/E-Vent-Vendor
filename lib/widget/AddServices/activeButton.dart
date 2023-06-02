import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';

class ActiveButton extends StatelessWidget {
  String title;
  String icon;
  Function activeButton;
  Color buttonColor;
  ActiveButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.buttonColor,
      required this.activeButton});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.38,
      height: height * 0.06,
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
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () => activeButton,
        icon: SvgPicture.asset(icon),
        label: Text(title),
      ),
    );
  }
}
