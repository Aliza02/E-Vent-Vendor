import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/firebaseController.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';
import 'message_controller.dart';

class ButtonController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final MessageController _msgController = Get.find<MessageController>();
  final firebasecontroller = Get.put(firebaseController());

  RxBool isExpanded = false.obs;
  RxBool isCatBtnToggled = true.obs;
  RxBool isViewMoreToggled = false.obs;
  RxBool isCustomBtnToggled = false.obs;
  AnimationController? animationController;
  late Animation<double> animation;
  TextEditingController offerAmountEditingController = TextEditingController();
  TextEditingController offerDetailsEditingController = TextEditingController();
  RxInt selectedButtonIndex = 0.obs;

  RxInt selectedCardIndex = 0.obs;

  RxList<bool> expansion = <bool>[].obs;
  RxList<bool> acceptOfferList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < 1000; i++) {
      expansion.add(false);
      acceptOfferList.add(false);
    }
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInOut,
    );
    offerAmountEditingController.text = ' ';

    updateAmount(offerAmountEditingController.text, selectedButtonIndex.value);

    // Dispose the controller when it is no longer needed
    // (You can also use `onClose` instead of `dispose` in newer versions of GetX)
    ever(isExpanded, (bool expanded) {
      if (!expanded) {
        animationController!.reverse();
      }
    });
  }

  void toggleCardExpansion(int index) {
    // Toggle the expansion state of the specified card
    expansion[index] = !expansion[index];
  }

  void sendOffer(String sendby) async {
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(_msgController.chatRoomId.value)
        .collection('chat')
        .doc()
        .set(
      {
        'amount': offerAmountEditingController.text,
        'sendby': sendby,
        // 'msg': offerAmountEditingController.text,
        'details': offerDetailsEditingController.text,
        'sent': DateTime.now().millisecondsSinceEpoch.toString(),
        'package': _msgController.packageName.value,
        'type': 'offer',
        'accept': 'false'
      },
      SetOptions(merge: true),
    );
    await FirebaseFirestore.instance
        .collection('User')
        .doc(auth.currentUser!.uid)
        .set(
      {
        'lastActive': DateTime.now().millisecondsSinceEpoch.toString(),
      },
      SetOptions(merge: true),
    );
    offerAmountEditingController.clear();
    offerDetailsEditingController.clear();

    toggleContainer();
    toggleOffer();
  }

  void toggleViewMore() {
    isViewMoreToggled.toggle();
  }

  void toggleOffer() {
    isCatBtnToggled.toggle();
    isCustomBtnToggled.toggle();
  }

  String viewMoreLessText(int index) {
    return expansion[index] ? 'View less' : 'View more';
  }

  void toggleCustom() {
    isCustomBtnToggled.toggle();
    isCatBtnToggled.toggle();
  }

  void toggleContainer() {
    isExpanded.toggle();
    if (isExpanded.value) {
      animationController!.forward();
    } else {
      animationController!.reverse();
    }
  }

  void updateAmount(String amount, int index) {
    offerAmountEditingController.text = amount;
    selectedButtonIndex.value = index;
  }

  @override
  void dispose() {
    animationController?.dispose();
    offerAmountEditingController.dispose();
    offerDetailsEditingController.dispose();
    super.dispose();
  }
}
