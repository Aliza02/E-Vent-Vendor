import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../constants/images.dart';

class forgotPasswordImage extends StatelessWidget {
  const forgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Image.asset(
        AppImages.forgotPassword,
        height: height * 0.35,
        width: width * 0.9,
      ),
    );
  }
}
