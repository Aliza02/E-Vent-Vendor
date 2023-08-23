import 'package:flutter/material.dart';
import 'package:get/get.dart';

class serviceController extends GetxController {
  // add service
  RxBool uploading = false.obs;
  final TextEditingController serviceName = TextEditingController();
  final TextEditingController serviceDescription = TextEditingController();
  final TextEditingController priceRange = TextEditingController();
  final TextEditingController noOfPerson = TextEditingController();

  final TextEditingController editServiceName = TextEditingController();
  final TextEditingController editServiceDescription = TextEditingController();
  final TextEditingController editPriceRange = TextEditingController();
  final TextEditingController editNoOfPerson = TextEditingController();

  List editImage = <String>[].obs;
  List uploadImage = <String>[].obs;

  RxBool enableImagePicker = false.obs;
  RxInt editImageIndex = 0.obs;

  RxString link = ''.obs;
  RxString currentUserBusinessCategory = ''.obs;
}
