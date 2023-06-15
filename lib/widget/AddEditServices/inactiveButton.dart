import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';

class InactiveButton extends StatelessWidget {
  final String title;
  final String icon;
  final Function activeButton;
  const InactiveButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.activeButton});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => activeButton(),
      icon: SvgPicture.asset(icon),
      label: Text(
        title,
        style: const TextStyle(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
