import 'package:eventually_vendor/constants/colors.dart';
import 'package:eventually_vendor/controller/message_controller.dart';
import 'package:eventually_vendor/controller/offer_btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_amount_button.dart';
import 'offer_custom_texts.dart';

class ChatOfferContainer extends StatelessWidget {
  final String sendby;
  ChatOfferContainer({
    required this.sendby,
    super.key,
  });
  // final MessageController _msgController = Get.find<MessageController>();
  final ButtonController _buttonController = Get.find<ButtonController>();
  final msgController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    final price1 = msgController.servicePriceOnChatOffer[0];
    final price2 = msgController.servicePriceOnChatOffer[1];
    final price3 = msgController.servicePriceOnChatOffer[2];
    // _buttonController.offerAmountEditingController.text = price1.toString();
    return SafeArea(
      child: Obx(
        () => Container(
          margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
          width: Get.width * .9,
          height: Get.height * .45,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 13,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: Get.width * .9,
                  height: Get.height * .4,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _buttonController.isCatBtnToggled.value
                          ? AppColors.blue
                          : AppColors.pink,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OfferNCustomTexts(
                        title: _buttonController.isCustomBtnToggled.value
                            ? 'Add Customization'
                            : 'Make an Offer',
                        package: 'Shadi Package',
                      ),
                      //don't wanna show in next widget
                      if (_buttonController.isCatBtnToggled.value)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomAmountButton(
                              amount: price1.toString(),
                              index: 0,
                              selectedButtonIndex: _buttonController
                                  .selectedButtonIndex.value.obs,
                              onPressed: (amount, index) =>
                                  _buttonController.updateAmount(amount, index),
                            ),
                            SizedBox(width: Get.width * .01),
                            CustomAmountButton(
                              amount: price2.toString(),
                              index: 1,
                              selectedButtonIndex: _buttonController
                                  .selectedButtonIndex.value.obs,
                              onPressed: (amount, index) =>
                                  _buttonController.updateAmount(amount, index),
                            ),
                            SizedBox(width: Get.width * .01),
                            CustomAmountButton(
                              amount: price3.toString(),
                              index: 2,
                              selectedButtonIndex: _buttonController
                                  .selectedButtonIndex.value.obs,
                              onPressed: (amount, index) =>
                                  _buttonController.updateAmount(amount, index),
                            ),
                          ],
                        ),
                      if (_buttonController.isCatBtnToggled.value)
                        SizedBox(
                            height: Get.height *
                                .05), //don't wanna show in next widget
                      _buttonController.isCatBtnToggled.value
                          ? Row(
                              //don't wanna show in next widget
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'RS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey),
                                ),
                                SizedBox(width: Get.width * .04),
                                SizedBox(
                                  width: Get.width * .2,
                                  child: TextFormField(
                                    controller: _buttonController
                                        .offerAmountEditingController,
                                    keyboardType: TextInputType.number,
                                    // validator: (value) {},
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      isCollapsed: true,
                                      hintText: 'Add Customizations here',
                                      hintStyle: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _buttonController.toggleCustom();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        backgroundColor: AppColors.blue),
                                    child: const Text(
                                      'Next',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: Get.height * .02),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * .02,
                                      vertical: Get.height * .01),
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _buttonController
                                        .offerDetailsEditingController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors
                                              .pink, // Specify the desired border color when the field is focused
                                          width:
                                              2.0, // Specify the desired border width
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors
                                              .pink, // Specify the desired border color
                                          width:
                                              2.0, // Specify the desired border width
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 5),
                                      isCollapsed: true,
                                      hintText: _buttonController
                                              .isCustomBtnToggled.value
                                          ? 'Add Customizations here'
                                          : 'Make an Offer',
                                      hintStyle: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height * .02),
                                Row(
                                  children: [
                                    const Spacer(),
                                    const Spacer(),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _buttonController.sendOffer(sendby);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          backgroundColor: _buttonController
                                                  .isCatBtnToggled.value
                                              ? AppColors.blue
                                              : AppColors.pink,
                                        ),
                                        child: const Text(
                                          'Send',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Get.width * .4,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _buttonController.isCatBtnToggled.value
                          ? AppColors.blue
                          : AppColors.pink,
                    ),
                  ),
                  child: IconButton(
                      onPressed: () {
                        _buttonController.toggleContainer();
                      },
                      highlightColor: Colors.transparent,
                      color: _buttonController.isCatBtnToggled.value
                          ? AppColors.blue
                          : AppColors.pink,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
