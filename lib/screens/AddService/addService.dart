import 'dart:io';

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
import '../../widget/AddServices/ImagesBoxLabels.dart';
import '../../widget/AddServices/serviceCardSwipableButton.dart';
import '../../widget/AddServices/textFieldLabel.dart';
import '../../widget/AddServices/textFormField.dart';

class AddService extends StatefulWidget {
  AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final pagecontroller = Get.put(testController());
  // Rxint imageIndex = 0.obs;
  int imgindex = 0;
  File? _image;
  List<File> selectedImage = [];
  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print(selectedImage.length);
      setState(() {
        _image = File(pickedImage.path);
        selectedImage.add(_image!);
        pagecontroller.imageIndex.value++;
        print('index');
        print(pagecontroller.imageIndex.value);
        // imageIndex++;
      });
    }
  }

  // widget to display selected images
  Container buildImage(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Get.width * 0.02),
        boxShadow: [
          BoxShadow(
            color: AppColors.pink.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 10.0,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      width: Get.width * 0.25,
      height: Get.height * 0.13,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Get.width * 0.02),
        child: Image.file(
          selectedImage[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

// add service section
  Widget addService(context) {
    return Obx(
      () => Column(
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
                // customized button "YES"
                Button(
                  label: 'Yes',
                  width: Get.width * 0.25,
                  height: Get.height * 0.06,
                  buttonColor: AppColors.blue,
                  fontSize: Get.width * 0.04,
                  borderRadius: 18.0,
                ),

                // customized button "NO"
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
          SizedBox(height: Get.height * 0.01),
          const Label(title: 'Service Images'),
          SizedBox(height: Get.height * 0.01),
          Container(
            padding: pagecontroller.imageIndex.value == 0
                ? EdgeInsets.all(0.0)
                : EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Row(
              mainAxisAlignment: pagecontroller.imageIndex.value == 0 ||
                      pagecontroller.imageIndex.value == 3
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(selectedImage.length,
                      (index) => buildImage(context, index)),
                ),
                pagecontroller.imageIndex.value <= 2
                    ? SizedBox(
                        width: pagecontroller.imageIndex.value > 0
                            ? Get.width * 0.4
                            : Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _openImagePicker();
                              },
                              child: DottedBorder(
                                // add image box
                                color: AppColors.grey,
                                strokeWidth: 2,
                                dashPattern: const [8, 8],
                                child: SizedBox(
                                  width: pagecontroller.imageIndex.value > 0
                                      ? Get.width * 0.3
                                      : Get.width * 0.84,
                                  height: Get.height * 0.09,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.addImage,
                                        height:
                                            pagecontroller.imageIndex.value > 0
                                                ? Get.height * 0.03
                                                : Get.height * 0.04,
                                        width:
                                            pagecontroller.imageIndex.value > 0
                                                ? Get.width * 0.03
                                                : Get.width * 0.08,
                                      ),
                                      SizedBox(width: Get.width * 0.01),
                                      pagecontroller.imageIndex.value > 0
                                          ? addImageBoxLabels(
                                              title: 'Add More',
                                              fontSize: Get.width * 0.04,
                                              fontWeight: AppFonts.bold,
                                              fontFamily: AppFonts.manrope)
                                          : addImageBoxLabels(
                                              title: 'Upload Image',
                                              fontSize: Get.width * 0.04,
                                              fontFamily: AppFonts.manrope,
                                              fontWeight: AppFonts.bold,
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Upload max 3 images',
                              style: TextStyle(
                                color: AppColors.grey.withOpacity(0.8),
                                fontSize: Get.width * 0.03,
                                fontFamily: AppFonts.manrope,
                                fontWeight: AppFonts.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
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
      ),
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
