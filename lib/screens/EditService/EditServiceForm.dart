import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../controller/services.dart';
import '../../widget/AddEditServices/Button.dart';
import '../../widget/AddEditServices/buildImage.dart';
import '../../widget/AddEditServices/textFormField.dart';
import '../../widget/AddEditServices/heading.dart';
import '../../widget/AddEditServices/subheading.dart';
import '../../widget/AddEditServices/textFieldLabel.dart';

class EditServiceForm extends StatefulWidget {
  const EditServiceForm({super.key});

  @override
  State<EditServiceForm> createState() => _EditServiceFormState();
}

class _EditServiceFormState extends State<EditServiceForm> {
  final pagecontroller = Get.put(testController());
  final servicecontroller = Get.put(serviceController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.2),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.12,
              decoration: BoxDecoration(
                color: AppColors.appBar.withOpacity(0.2),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                  child: serviceHeading(
                    title: 'Edit Services',
                    fontColor: AppColors.pink,
                    fontSize: Get.width * 0.07,
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.extraBold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                  child: serviceSubHeading(
                    title:
                        "Follow the service adding rules while updating the service ",
                    fontColor: AppColors.grey,
                    fontFamily: AppFonts.manrope,
                    fontSize: Get.width * 0.03,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                SizedBox(height: Get.height * 0.06),
                const Label(title: 'Service Name'),
                textFormField(
                  maxLines: 1,
                  enabledField: false,
                  inputtype: TextInputType.text,
                  textController: servicecontroller.editServiceName,
                ),
                const Label(title: 'Description'),
                textFormField(
                  maxLines: 5,
                  enabledField: true,
                  inputtype: TextInputType.text,
                  textController: servicecontroller.editServiceDescription,
                ),
                const Label(title: 'Price Range'),
                textFormField(
                  maxLines: 1,
                  enabledField: true,
                  inputtype: TextInputType.text,
                  textController: servicecontroller.editPriceRange,
                ),
                const Label(title: 'Number of Person'),
                textFormField(
                  maxLines: 1,
                  enabledField: true,
                  inputtype: TextInputType.number,
                  textController: servicecontroller.editNoOfPerson,
                ),
                const Label(title: 'Service Images'),
                SizedBox(height: Get.height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => servicecontroller.editImageIndex.value > 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                servicecontroller.editImage.length,
                                (index) => buildImage(index: index),
                              ),
                            )
                          : Container(),
                    ),
                    Obx(
                      () => servicecontroller.editImageIndex.value < 3 &&
                              servicecontroller.uploading.value == false
                          ? InkWell(
                              onTap: () async {
                                print(servicecontroller.uploading.value);
                                File? _image;
                                // This is the image picker
                                final _picker = ImagePicker();
                                final XFile? pickedImage = await _picker
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedImage != null) {
                                  setState(() {
                                    _image = File(pickedImage.path);
                                  });
                                }
                                servicecontroller.uploading.value = true;
                                String uniqueFileName = DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString();
                                print(servicecontroller.link.value);
                                Reference referenceBoot = FirebaseStorage
                                    .instance
                                    .refFromURL(servicecontroller.link.value);

                                if (_image != null) {
                                  await referenceBoot
                                      .putFile(File(_image!.path));

                                  servicecontroller.editImage
                                      .add(servicecontroller.link.value);
                                  print('uploaded');
                                }

                                servicecontroller.editImageIndex.value++;
                                servicecontroller.uploading.value = false;
                              },
                              child: SvgPicture.asset(AppIcons.addImage))
                          : servicecontroller.uploading.value == true
                              ? const SpinKitFadingCircle(
                                  color: AppColors.pink,
                                )
                              : Container(),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.025),
                Obx(
                  () => Button(
                    onPressed: () {
                      if (servicecontroller.editImageIndex.value < 3) {
                        Get.showSnackbar(
                          const GetSnackBar(
                            title: 'Upload Image ',
                            message: 'Add More Images',
                            backgroundColor: AppColors.pink,
                            duration: Duration(seconds: 2),
                            icon: Icon(Icons.incomplete_circle_rounded),
                          ),
                        );
                      } else {
                        updateService(
                                servicecontroller.editServiceName.text,
                                servicecontroller.editServiceDescription.text,
                                servicecontroller.editPriceRange.text,
                                servicecontroller.editNoOfPerson.text)
                            .then(
                          (value) => Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Successfull',
                              message:
                                  'Your Service has been updated successfully',
                              backgroundColor: AppColors.pink,
                              duration: Duration(seconds: 2),
                              icon: Icon(Icons.incomplete_circle_rounded),
                            ),
                          ),
                        );
                        Get.back();
                      }
                    },
                    label: 'Save Changes',
                    width: Get.width * 0.45,
                    height: Get.height * 0.06,
                    buttonColor: servicecontroller.uploading.value == true
                        ? AppColors.grey.withOpacity(0.5)
                        : AppColors.pink,
                    fontSize: Get.width * 0.05,
                    borderRadius: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
