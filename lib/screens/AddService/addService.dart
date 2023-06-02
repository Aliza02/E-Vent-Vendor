import 'package:eventually_vendor/constants/font.dart';
import 'package:eventually_vendor/widget/AddServices/header.dart';
import 'package:eventually_vendor/widget/AddServices/inactiveButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/AddServices/activeButton.dart';
import '../../widget/AddServices/heading.dart';
import '../../widget/AddServices/subheading.dart';

class AddService extends GetView<testController> {
  AddService({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          service_Header(),
        ],
      ),
    );
  }
}
