import 'package:eventually_vendor/controller/message_controller.dart';
import 'package:eventually_vendor/controller/offer_btn_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => ButtonController());
  }
}
