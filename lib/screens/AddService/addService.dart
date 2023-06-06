import 'package:dotted_border/dotted_border.dart';
import 'package:eventually_vendor/widget/AddServices/serviceHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/AddServices/Button.dart';
import '../../widget/AddServices/textFieldLabel.dart';
import '../../widget/AddServices/textFormField.dart';

class AddService extends GetView<testController> {
  AddService({super.key});

  final pagecontroller = Get.put(testController());

// add service section
  Widget addService(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // service_Header(),
        Label(title: 'Service Name'),
        const textFormField(),
        Label(title: 'Description'),
        const textFormField(),
        Label(title: 'Price Range'),
        const textFormField(),
        Label(title: 'Number of Person'),
        const textFormField(),
        Label(title: 'Customizable'),
        Container(
          margin: EdgeInsets.only(left: width * 0.06),
          child: Row(
            children: [
              Button(
                label: 'Yes',
                width: width * 0.25,
                height: height * 0.06,
                buttonColor: AppColors.blue,
                fontSize: width * 0.04,
                borderRadius: 18.0,
              ),
              Button(
                label: 'No',
                width: width * 0.25,
                height: height * 0.06,
                buttonColor: AppColors.pink,
                fontSize: width * 0.04,
                borderRadius: 18.0,
              ),
            ],
          ),
        ),
        const SizedBox(height: 6.0),
        Label(title: 'Service Images'),
        const SizedBox(height: 10.0),
        DottedBorder(
          color: AppColors.grey,
          strokeWidth: 2,
          dashPattern: const [8, 8],
          child: Container(
            width: width * 0.84,
            height: height * 0.09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.addImage,
                  height: height * 0.04,
                  width: width * 0.08,
                ),
                const SizedBox(width: 10.0),
                Text(
                  'Upload Image',
                  style: TextStyle(
                    color: AppColors.grey.withOpacity(0.8),
                    fontSize: width * 0.04,
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'Upload max 3 images',
          style: TextStyle(
            color: AppColors.grey.withOpacity(0.8),
            fontSize: width * 0.04,
            fontFamily: AppFonts.manrope,
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Button(
          label: 'Add Service',
          width: width * 0.45,
          height: height * 0.06,
          buttonColor: AppColors.pink,
          fontSize: width * 0.05,
          borderRadius: 16.0,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              service_Header(),
              Obx(() => pagecontroller.AddServiceSelected.value
                  ? addService(context)
                  : Container()),
              // addService(context),
            ],
          ),
        ),
      ),
    );
  }
}
