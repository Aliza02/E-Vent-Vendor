import 'package:eventually_vendor/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/colors.dart';
import '../constants/constant.dart';
import '../constants/font.dart';

class PasswordField extends StatefulWidget {
  String title;
  PasswordField({required this.title});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: AppColors.fieldFillColor.withOpacity(0.5),
        filled: true,
        hintText: widget.title,
        hintStyle: TextStyle(
          fontFamily: manrope,
          color: Colors.grey,
          fontSize: width * 0.04,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * 0.02),
          borderSide: BorderSide(
            color: AppColors.pink,
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(width * 0.02),
          borderSide: BorderSide(
            color: AppColors.pink,
            width: 1.3,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText == true
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey,
            size: width * 0.05,
          ),
        ),
      ),
    );
  }
}
