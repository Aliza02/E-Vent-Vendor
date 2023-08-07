import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eventually_vendor/firebaseMethods/addService.dart';
import 'package:eventually_vendor/widget/AddEditServices/serviceHeader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../controller/services.dart';
import '../../widget/AddEditServices/Button.dart';
import '../../widget/AddEditServices/ImagesBoxLabels.dart';
import '../../widget/AddEditServices/buildImage.dart';
import '../../widget/AddEditServices/deleteConfirmDialogButton.dart';
import '../../widget/AddEditServices/deleteConfirmationDialogText.dart';
import '../../widget/AddEditServices/serviceCardSwipableButton.dart';
import '../../widget/AddEditServices/textFieldLabel.dart';
import '../../widget/AddEditServices/textFormField.dart';
import '../../widget/AddEditServices/serviceCardDetail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddService extends StatefulWidget {
  AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final pagecontroller = Get.put(testController());
  final servicecontroller = Get.put(serviceController());

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
      });
      print('image picker');
      uploadImage(pagecontroller.imageIndex.value);
      pagecontroller.imageIndex.value++;
    }
  }

  //upload seleccted image to firebase storage
  void uploadImage(int index) async {
    String imageLink;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceBoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceBoot
        .child(auth.currentUser!.uid.toString())
        .child(servicecontroller.serviceName.text);
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      if (pagecontroller.selectedImage.isNotEmpty) {
        servicecontroller.uploading.value = true;
        print('upload func');
        await referenceImageToUpload
            .putFile(File(pagecontroller.selectedImage[index].path));
        imageLink = await referenceImageToUpload.getDownloadURL();
        print(imageLink);

        servicecontroller.uploadImage.add(imageLink);
        servicecontroller.uploading.value = false;

        print('upload func');
      }
    } catch (error) {
      print(error);
    }
  }

// delete selected image from firebase storage

  void validateAddService() {
    if (servicecontroller.serviceName.text.isEmpty ||
        servicecontroller.serviceDescription.text.isEmpty ||
        servicecontroller.priceRange.text.isEmpty ||
        servicecontroller.noOfPerson.text.isEmpty) {
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
    } else if (servicecontroller.uploadImage.length < 3) {
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
          serviceName: servicecontroller.serviceName.text,
          serviceDescription: servicecontroller.serviceDescription.text,
          priceRange: servicecontroller.priceRange.text,
          noOfPerson: servicecontroller.noOfPerson.text,
          image1URL: servicecontroller.uploadImage[0],
          image2URL: servicecontroller.uploadImage[1],
          image3URL: servicecontroller.uploadImage[2]);
      servicecontroller.serviceName.clear();
      servicecontroller.serviceDescription.clear();
      servicecontroller.noOfPerson.clear();
      servicecontroller.priceRange.clear();
      pagecontroller.selectedImage.clear();
      servicecontroller.uploadImage.clear();
      pagecontroller.imageIndex.value = 0;

      Get.showSnackbar(
        const GetSnackBar(
          title: 'Service Added',
          message: 'Your Service has been added',
          backgroundColor: AppColors.pink,
          duration: Duration(seconds: 2),
          icon: Icon(Icons.incomplete_circle_rounded),
        ),
      );
    }
  }

// add service section
  Widget addService(context) {
    return Obx(
      () => LiquidPullToRefresh(
        color: AppColors.pink,
        onRefresh: () async {
          print('refresh');
          servicecontroller.serviceName.clear();
          servicecontroller.serviceDescription.clear();
          servicecontroller.noOfPerson.clear();
          servicecontroller.priceRange.clear();
          pagecontroller.selectedImage.clear();
          pagecontroller.imageIndex.value = 0;
          return await Future.delayed(const Duration(seconds: 2));
        },
        child: Column(
          children: [
            const Label(title: 'Service Name'),
            textFormField(
                maxLines: 1,
                enabledField: true,
                textController: servicecontroller.serviceName,
                inputtype: TextInputType.text),
            const Label(title: 'Description'),
            textFormField(
              maxLines: 5,
              enabledField: true,
              textController: servicecontroller.serviceDescription,
              inputtype: TextInputType.text,
            ),
            const Label(title: 'Price Range'),
            textFormField(
                maxLines: 1,
                enabledField: true,
                textController: servicecontroller.priceRange,
                inputtype: TextInputType.text),
            const Label(title: 'Number of Person'),
            textFormField(
                maxLines: 1,
                enabledField: true,
                textController: servicecontroller.noOfPerson,
                inputtype: TextInputType.number),
            const Label(title: 'Service Images'),
            SizedBox(height: Get.height * 0.01),
            Container(
              padding: pagecontroller.imageIndex.value == 0
                  ? const EdgeInsets.all(0.0)
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
                              servicecontroller.uploading.value == true
                                  ? const SpinKitFadingCircle(
                                      color: AppColors.pink,
                                    )
                                  : InkWell(
                                      onTap: () {
                                        if (servicecontroller
                                            .serviceName.text.isNotEmpty) {
                                          _openImagePicker();
                                        } else {
                                          Get.showSnackbar(
                                            const GetSnackBar(
                                              title: 'No Service Name',
                                              message: 'Enter Service Name',
                                              backgroundColor: AppColors.pink,
                                              duration: Duration(seconds: 2),
                                              icon: Icon(Icons
                                                  .incomplete_circle_rounded),
                                            ),
                                          );
                                        }
                                      },
                                      child: DottedBorder(
                                        // add image box
                                        color: AppColors.grey,
                                        strokeWidth: 2,
                                        dashPattern: const [8, 8],
                                        child: SizedBox(
                                          width:
                                              pagecontroller.imageIndex.value >
                                                      0
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
                                              pagecontroller.imageIndex.value >
                                                      0
                                                  ? addImageBoxLabels(
                                                      title: 'Add More',
                                                      fontSize:
                                                          Get.width * 0.04,
                                                      fontWeight: AppFonts.bold,
                                                      fontFamily:
                                                          AppFonts.manrope)
                                                  : addImageBoxLabels(
                                                      title: 'Upload Image',
                                                      fontSize:
                                                          Get.width * 0.04,
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
            servicecontroller.uploading.value == true
                ? Container(
                    alignment: Alignment.center,
                    width: Get.width * 0.45,
                    height: Get.height * 0.06,
                    margin: EdgeInsets.symmetric(
                        vertical: Get.height * 0.06 * 0.1,
                        horizontal: Get.width * 0.03 * 0.45),
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
      ),
    );
  }

  final CollectionReference services = FirebaseFirestore.instance
      .collection('Services')
      .doc(auth.currentUser!.uid)
      .collection(auth.currentUser!.displayName.toString());

  int selectedDocIndex = 0;
  // Edit Services
  Widget editService(context) {
    return StreamBuilder(
      stream: services.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];

              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    swipeableButton(
                      buttonColor: AppColors.blue,
                      buttonIcon: AppIcons.editActive,
                      onPressed: () {
                        selectedDocIndex = index;
                        print(selectedDocIndex);
                        doc = snapshot.data!.docs[selectedDocIndex];

                        servicecontroller.editServiceName.text =
                            doc['Service Name'];
                        servicecontroller.editServiceDescription.text =
                            doc['Service Description'];
                        servicecontroller.editNoOfPerson.text =
                            doc['NoOfPerson'];
                        servicecontroller.editPriceRange.text =
                            doc['Service Price'];

                        servicecontroller.editImage = [
                          doc['image1'],
                          doc['image2'],
                          doc['image3'],
                        ];

                        servicecontroller.editImageIndex.value = 3;
                        Get.toNamed('/editServiceForm');

                        print(servicecontroller.editImage);
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
                              text:
                                  "Are you sure you want to delete this service?",
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
                                onpressed: () async {
                                  selectedDocIndex = index;
                                  doc = snapshot.data!.docs[selectedDocIndex];
                                  servicecontroller.serviceName.text =
                                      doc['Service Name'];
                                  print(servicecontroller.serviceName.text);
                                  await FirebaseStorage.instance
                                      .ref(
                                          "${FirebaseAuth.instance.currentUser!.uid}/${servicecontroller.serviceName.text}")
                                      .listAll()
                                      .then((value) {
                                    value.items.forEach((element) {
                                      FirebaseStorage.instance
                                          .ref(element.fullPath)
                                          .delete();
                                    });
                                  });
                                  deleteService(
                                          servicecontroller.serviceName.text)
                                      .then(
                                    (value) => Get.showSnackbar(
                                      const GetSnackBar(
                                        title: 'Successfull',
                                        message:
                                            'Your Service has been deleted',
                                        backgroundColor: AppColors.pink,
                                        duration: Duration(seconds: 2),
                                        icon: Icon(
                                            Icons.incomplete_circle_rounded),
                                      ),
                                    ),
                                  );

                                  Get.back();
                                },
                              ),
                              dialogButton(
                                onpressed: () {
                                  Get.back();
                                },
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
                      children: [
                        Container(
                          height: Get.height * 0.16,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Get.width * 0.08),
                                bottomLeft: Radius.circular(Get.width * 0.08),
                              ),
                              child: Image.network(
                                doc['image1'],
                                width: Get.width * 0.25,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Expanded(
                          child: ServiceCardDetails(
                            serviceName: doc['Service Name'],
                            serviceDesc: doc['Service Description'],
                            priceRange: doc['Service Price'],
                            noOfperson: doc['NoOfPerson'],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LiquidPullToRefresh(
          color: AppColors.pink,
          height: 200,
          backgroundColor: AppColors.appBar,
          onRefresh: () async {
            servicecontroller.serviceName.clear();
            servicecontroller.serviceDescription.clear();
            servicecontroller.noOfPerson.clear();
            servicecontroller.priceRange.clear();
            pagecontroller.imageIndex.value = 0;
            pagecontroller.selectedImage.clear();

            return await Future.delayed(const Duration(seconds: 2));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const service_Header(),
              Expanded(
                child: Obx(
                  () => pagecontroller.addServiceSelected.value
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: addService(context),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: editService(context),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
