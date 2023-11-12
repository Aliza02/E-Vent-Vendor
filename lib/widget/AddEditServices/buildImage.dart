import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/pagecontroller.dart';
import '../../controller/services.dart';

class buildImage extends StatelessWidget {
  int index;
  buildImage({super.key, required this.index});
  final pagecontroller = Get.put(testController());
  final servicecontroller = Get.put(serviceController());
  @override
  Widget build(BuildContext context) {
    int removeElementFrom;
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
      child: pagecontroller.editServiceSelected.value == true
          ? Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                  // child: Image.asset('assets/images/food.png'),
                  child: Image.network(
                    servicecontroller.editImage[index],
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  alignment: Alignment.topRight,
                  onPressed: () async {
                    removeElementFrom = index;

                    servicecontroller.link.value =
                        servicecontroller.editImage[index];

                    servicecontroller.editImage.removeAt(removeElementFrom);
                    servicecontroller.editImageIndex.value--;
                  },
                  icon: const Icon(
                    Icons.cancel,
                  ),
                ),
              ],
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(Get.width * 0.02),
                    // child: Image.asset('assets/images/food.png'),
                    child: Image.file(
                      pagecontroller.selectedImage[index],
                      fit: BoxFit.cover,
                    )),
                servicecontroller.uploading.value == false
                    ? IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () async {
                          removeElementFrom = index;
                          pagecontroller.selectedImage
                              .removeAt(removeElementFrom);

                          // print(removeElementFrom);
                          print(servicecontroller.uploadImage.length);
                          // print(pagecontroller.selectedImage);
                          pagecontroller.imageIndex.value--;
                          Reference ref = FirebaseStorage.instance
                              .refFromURL(servicecontroller.uploadImage[index]);
                          await ref.delete();

                          servicecontroller.uploadImage
                              .removeAt(removeElementFrom);
                          print('deleted');
                        },
                        icon: const Icon(
                          Icons.cancel,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
    );
  }
}
