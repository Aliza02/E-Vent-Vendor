import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgotPasswordImage extends StatelessWidget {
  final String imageUrl;
  const forgotPasswordImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.03),
      child: Image.asset(
        imageUrl,
        height: Get.height * 0.35,
        width: Get.width * 0.9,
      ),
    );
  }
}
