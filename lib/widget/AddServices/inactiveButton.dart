import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';

class InactiveButton extends StatelessWidget {
  String title;
  String icon;
  Function activeButton;
  InactiveButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.activeButton});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => activeButton(),
      icon: SvgPicture.asset(this.icon),
      label: Text(
        this.title,
        style: TextStyle(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
