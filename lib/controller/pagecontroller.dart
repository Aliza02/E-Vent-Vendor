import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class testController extends GetxController {
  RxInt currentindex = 0.obs; // bottom navigation index
  RxInt indexOfDrawerMenuItems = 0.obs; // drawer menu
  RxInt imageIndex = 0.obs;
  List selectedImage = <File>[].obs;

  // variables to active and deactive tabs of orders screen
  RxBool toCompleteActive = true.obs;
  RxBool completeActive = false.obs;
  RxBool allOrdersActive = false.obs;

  RxBool EditServiceSelected = true.obs; // edit service button
  RxBool AddServiceSelected = false.obs; // Add service button

  // function for changing index to navigate from bottom nav bar
  void changeIndex(int index) {
    currentindex.value = index;
  }
}
