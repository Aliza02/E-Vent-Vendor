import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplainSuccess extends StatelessWidget {
  const ComplainSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar.withOpacity(0.3),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text('Help Center',
            style: TextStyle(
              color: AppColors.grey,
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                width: 186,
                height: 189,
                child: Image.asset("assets/images/girl.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
              child: Container(
                  alignment: Alignment.center,
                  width: 296,
                  height: 66,
                  child: Center(
                    child: Text(
                      "     Your Complaint is Successfully registered",
                      style: TextStyle(
                        fontSize: Get.width * 0.06,
                        color: Color.fromRGBO(203, 88, 90, 1),
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.extraBold,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Container(
                  width: 324,
                  height: 44,
                  child: Center(
                    child: Text(
                      "Your complaint will be soon entertained by \n help desk team.",
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
