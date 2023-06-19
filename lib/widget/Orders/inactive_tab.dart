import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class inactive_tab extends StatelessWidget {
  final String title;
  final Function activeTab;
  inactive_tab({super.key, required this.title, required this.activeTab});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => activeTab(),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.grey,
          fontSize: Get.width * 0.04,
        ),
      ),
    );
  }
}
