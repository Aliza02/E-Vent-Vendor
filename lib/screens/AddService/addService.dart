import 'package:eventually_vendor/widget/AddServices/serviceHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/AddServices/textFieldLabel.dart';
import '../../widget/AddServices/textFormField.dart';

class AddService extends GetView<testController> {
  const AddService({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          service_Header(),
          Label(title: 'Service Name'),
          const textFormField(),
          Label(title: 'Description'),
          const textFormField(),
          Label(title: 'Price Range'),
          const textFormField(),
          Label(title: 'Number of Person'),
          const textFormField(),
        ],
      ),
    );
  }
}
