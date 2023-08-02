import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:eventually_vendor/widget/AddEditServices/serviceHeader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/AddEditServices/Button.dart';
import '../../widget/AddEditServices/ImagesBoxLabels.dart';
import '../../widget/AddEditServices/buildImage.dart';
import '../../widget/AddEditServices/deleteConfirmDialogButton.dart';
import '../../widget/AddEditServices/deleteConfirmationDialogText.dart';
import '../../widget/AddEditServices/serviceCardSwipableButton.dart';
import '../../widget/AddEditServices/textFieldLabel.dart';
import '../../widget/AddEditServices/textFormField.dart';
import '../../widget/AddEditServices/serviceCardDetail.dart';
import '../login.dart';

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

  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        pagecontroller.selectedImage.add(_image!);

        // print(pagecontroller.imageIndex.value);
      });
      print('image picker');
      uploadImage(pagecontroller.imageIndex.value);
      pagecontroller.imageIndex.value++;
    }
  }

  List<String> imageURL = [];
  // String imageURl = '';
  int imageIndex = 0;
  void uploadImage(int index) async {
    String imageLink;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceBoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceBoot.child(auth.currentUser!.uid.toString());
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      if (pagecontroller.selectedImage.isNotEmpty) {
        pagecontroller.uploading.value = true;
        print('upload func');
        await referenceImageToUpload
            .putFile(File(pagecontroller.selectedImage[index].path));

        imageLink = await referenceImageToUpload.getDownloadURL();
        print(imageLink);
        imageURL.add(imageLink);
        pagecontroller.uploading.value = false;

        print('upload func');
      }
    } catch (error) {
      print(error);
    }
  }

  void validateAddService() {
    if (pagecontroller.serviceName.text.isEmpty ||
        pagecontroller.serviceDescription.text.isEmpty ||
        pagecontroller.priceRange.text.isEmpty ||
        pagecontroller.noOfPerson.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Incomplete Details',
          message: 'Enter all Details',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );

      //
    } else if (imageURL.length < 3) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Upload Images',
          message: 'Select 3 Images',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    } else {
      addServices(
          serviceName: pagecontroller.serviceName.text,
          serviceDescription: pagecontroller.serviceDescription.text,
          princeRange: pagecontroller.priceRange.text,
          noOfPerson: pagecontroller.noOfPerson.text,
          image1URL: imageURL[0],
          image2URL: imageURL[1],
          image3URL: imageURL[2]);
    }
  }

// add service section
  Widget addService(context) {
    return Obx(
      () => Column(
        children: [
          const Label(title: 'Service Name'),
          textFormField(
              textController: pagecontroller.serviceName,
              inputtype: TextInputType.text),
          const Label(title: 'Description'),
          textFormField(
            textController: pagecontroller.serviceDescription,
            inputtype: TextInputType.text,
          ),
          const Label(title: 'Price Range'),
          textFormField(
              textController: pagecontroller.priceRange,
              inputtype: TextInputType.text),
          const Label(title: 'Number of Person'),
          textFormField(
              textController: pagecontroller.noOfPerson,
              inputtype: TextInputType.number),
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
                  children: List.generate(pagecontroller.selectedImage.length,
                      (index) => buildImage(index: index)),
                ),
                pagecontroller.imageIndex.value <= 2
                    ? SizedBox(
                        width: pagecontroller.imageIndex.value > 0
                            ? Get.width * 0.4
                            : Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            pagecontroller.uploading.value == true
                                ? CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      _openImagePicker();
                                      // print(imageIndex);
                                      // imageIndex++;
                                    },
                                    child: DottedBorder(
                                      // add image box
                                      color: AppColors.grey,
                                      strokeWidth: 2,
                                      dashPattern: const [8, 8],
                                      child: SizedBox(
                                        width:
                                            pagecontroller.imageIndex.value > 0
                                                ? Get.width * 0.3
                                                : Get.width * 0.84,
                                        height: Get.height * 0.09,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppIcons.addImage,
                                              height: pagecontroller
                                                          .imageIndex.value >
                                                      0
                                                  ? Get.height * 0.03
                                                  : Get.height * 0.04,
                                              width: pagecontroller
                                                          .imageIndex.value >
                                                      0
                                                  ? Get.width * 0.03
                                                  : Get.width * 0.08,
                                            ),
                                            SizedBox(width: Get.width * 0.01),
                                            pagecontroller.imageIndex.value > 0
                                                ? addImageBoxLabels(
                                                    title: 'Add More',
                                                    fontSize: Get.width * 0.04,
                                                    fontWeight: AppFonts.bold,
                                                    fontFamily:
                                                        AppFonts.manrope)
                                                : addImageBoxLabels(
                                                    title: 'Upload Image',
                                                    fontSize: Get.width * 0.04,
                                                    fontFamily:
                                                        AppFonts.manrope,
                                                    fontWeight: AppFonts.bold,
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 10.0),
                            addImageBoxLabels(
                                title: 'Upload max 3 images',
                                fontSize: Get.width * 0.03,
                                fontWeight: AppFonts.bold,
                                fontFamily: AppFonts.manrope),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          pagecontroller.uploading.value == true
              ? Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.45,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    'Add Service',
                    style: TextStyle(
                      color: AppColors.grey.withOpacity(0.1),
                      fontSize: Get.width * 0.05,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                )
              : Button(
                  onPressed: () {
                    validateAddService();
                  },
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
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              swipeableButton(
                buttonColor: AppColors.blue,
                buttonIcon: AppIcons.editActive,
                onPressed: () {
                  Get.toNamed('/editServiceForm');
                },
              ),
              swipeableButton(
                buttonColor: AppColors.pink,
                buttonIcon: AppIcons.delete,
                onPressed: () {
                  Get.dialog(
                    transitionCurve: const ElasticInCurve(0.4),
                    transitionDuration: const Duration(milliseconds: 800),
                    AlertDialog(
                      shadowColor: AppColors.pink,
                      actionsAlignment: MainAxisAlignment.center,
                      content: dialog_Text(
                        text: "Are you sure you want to delete this service?",
                        fontSize: Get.width * 0.04,
                        fontWeight: AppFonts.regular,
                        textColor: AppColors.grey,
                      ),
                      title: dialog_Text(
                        text: "Confirm Deletion",
                        fontSize: Get.width * 0.06,
                        fontWeight: AppFonts.extraBold,
                        textColor: AppColors.pink,
                      ),
                      actions: [
                        dialogButton(
                          buttonTitle: 'Yes',
                          buttonColor: AppColors.blue,
                        ),
                        dialogButton(
                          buttonTitle: 'No',
                          buttonColor: AppColors.pink,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              width: Get.width * 0.86,
              height: Get.height * 0.16,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(0.1),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(Get.width * 0.08),
              ),
              child: Row(
                // mainAxisAlignment: pagecontroller.selectedImage.isEmpty
                //     ? MainAxisAlignment.center
                //     : MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Get.width * 0.08),
                        bottomLeft: Radius.circular(Get.width * 0.08),
                      ),
                      child: pagecontroller.selectedImage.isNotEmpty
                          ? Image.file(
                              pagecontroller.selectedImage[0],
                              width: Get.width * 0.25,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(
                              width: Get.width * 0.25,
                            ),
                    ),
                  ),
                  const Expanded(
                    child: ServiceCardDetails(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            service_Header(),
            Obx(
              () => pagecontroller.addServiceSelected.value
                  ? Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: addService(context),
                      ),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: editService(context),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
