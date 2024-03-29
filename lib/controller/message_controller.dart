import 'package:get/get.dart';

import '../models/message_model.dart';

class MessageController extends GetxController {
  RxList<MessageModel> _list = <MessageModel>[].obs;

  RxList<MessageModel> get list => _list;

  final RxString userId = ''.obs;
  final RxString userName = ''.obs;
  final RxString packageName = ''.obs;

  final RxString chatRoomId = ''.obs;
  final RxInt viewMoreButtonLength = 0.obs;
  RxList<int> servicePriceOnChatOffer = <int>[].obs;

  RxList<String> chatUserId = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with some data
    _list.addAll([
      //  Add more MessageModel objects as needed
    ]);
  }

  void addMessage(MessageModel message) {
    _list.insert(0, message);
    update(); // Notify the UI that the list has been updated
  }
}
