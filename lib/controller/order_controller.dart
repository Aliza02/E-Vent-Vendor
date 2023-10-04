import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<String> idToGetOrders = <String>[].obs;
  RxString serviceName = ''.obs;
  RxString orderId = ''.obs;
  RxString servicePrice = ''.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString customerName = ''.obs;
  RxString location = ''.obs;

  RxInt activeOrdersCount = 0.obs;
  RxInt completedOrdersCount = 0.obs;

  // order sttaus bar

  RxList<bool> orderStatusOnHeader = <bool>[
    false,
    false,
  ].obs;
// doc id of orders collection of user to retreieve order information
  RxString userOrderDocId = ''.obs;
}
