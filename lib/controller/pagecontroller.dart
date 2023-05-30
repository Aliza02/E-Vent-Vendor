import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class testController extends GetxController {
  var currentindex = 0.obs;
  var indexOfDrawerMenuItems = 0.obs;
  void changeIndex(int index) {
    currentindex.value = index;
  }
}
