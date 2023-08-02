import 'package:flutter/material.dart';
import 'package:get/get.dart';

class serviceController extends GetxController {
  // add service
  RxBool uploading = false.obs;
  final TextEditingController serviceName = TextEditingController();
  final TextEditingController serviceDescription = TextEditingController();
  final TextEditingController priceRange = TextEditingController();
  final TextEditingController noOfPerson = TextEditingController();
}
