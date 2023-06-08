import 'package:dotted_border/dotted_border.dart';
import 'package:eventually_vendor/widget/AddServices/serviceHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/AddServices/Button.dart';
import '../../widget/AddServices/serviceCardSwipableButton.dart';
import '../../widget/AddServices/textFieldLabel.dart';
import '../../widget/AddServices/textFormField.dart';

class AddService extends GetView<testController> {
  AddService({super.key});

  final pagecontroller = Get.put(testController());

// add service section
  Widget addService(context) {
    return Column(
      children: [
        const Label(title: 'Service Name'),
        const textFormField(),
        const Label(title: 'Description'),
        const textFormField(),
        const Label(title: 'Price Range'),
        const textFormField(),
        const Label(title: 'Number of Person'),
        const textFormField(),
        const Label(title: 'Customizable'),
        Container(
          margin: EdgeInsets.only(left: Get.width * 0.06),
          child: Row(
            children: [
              Button(
                label: 'Yes',
                width: Get.width * 0.25,
                height: Get.height * 0.06,
                buttonColor: AppColors.blue,
                fontSize: Get.width * 0.04,
                borderRadius: 18.0,
              ),
              Button(
                label: 'No',
                width: Get.width * 0.25,
                height: Get.height * 0.06,
                buttonColor: AppColors.pink,
                fontSize: Get.width * 0.04,
                borderRadius: 18.0,
              ),
            ],
          ),
        ),
        const SizedBox(height: 6.0),
        const Label(title: 'Service Images'),
        const SizedBox(height: 10.0),
        InkWell(
          onTap: () {},
          child: InkWell(
            onTap: () {},
            child: DottedBorder(
              color: AppColors.grey,
              strokeWidth: 2,
              dashPattern: const [8, 8],
              child: SizedBox(
                width: Get.width * 0.84,
                height: Get.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.addImage,
                      height: Get.height * 0.04,
                      width: Get.width * 0.08,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: AppColors.grey.withOpacity(0.8),
                        fontSize: Get.width * 0.04,
                        fontFamily: AppFonts.manrope,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'Upload max 3 images',
          style: TextStyle(
            color: AppColors.grey.withOpacity(0.8),
            fontSize: Get.width * 0.04,
            fontFamily: AppFonts.manrope,
            fontWeight: AppFonts.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Button(
          label: 'Add Service',
          width: Get.width * 0.45,
          height: Get.height * 0.06,
          buttonColor: AppColors.pink,
          fontSize: Get.width * 0.05,
          borderRadius: 16.0,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  // Edit Services

  Widget editService(context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              swipeableButton(
                buttonColor: AppColors.blue,
                buttonIcon: AppIcons.editActive,
              ),
              swipeableButton(
                buttonColor: AppColors.pink,
                buttonIcon: AppIcons.delete,
              ),
            ],
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              width: Get.width * 0.8,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(children: [
                Container(
                  child: Image.asset(AppImages.googleLogo),
                ),
              ]),
            ),
          ),
        );
      },
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              service_Header(),
              Obx(
                () => pagecontroller.AddServiceSelected.value
                    ? addService(context)
                    : editService(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
