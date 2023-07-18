import 'dart:io';
import 'package:get/get.dart';

class testController extends GetxController {
  RxInt currentindex = 0.obs; // bottom navigation index
  RxInt indexOfDrawerMenuItems = 0.obs; // drawer menu
  RxInt imageIndex = 0.obs;
  List selectedImage = <File>[].obs;

  // variables to active and deactive tabs of orders screen
  RxBool toCompleteActive = true.obs;
  RxBool completeActive = false.obs;
  RxBool allOrdersActive = false.obs;
  RxBool editServiceSelected = true.obs; // edit service button
  RxBool addServiceSelected = false.obs; // Add service button
  RxBool paymentPending = false.obs;
  RxBool paymentRecieved = false.obs;
  RxBool orderCompleted = false.obs;
  RxBool orderTabs = true.obs;

  RxBool orderDetailEnable = false.obs;
  // function for changing index to navigate from bottom nav bar
  void changeIndex(int index) {
    currentindex.value = index;
  }

  RxDouble currentDateIndex = 0.0.obs;
}
