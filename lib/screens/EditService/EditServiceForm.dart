import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../controller/pagecontroller.dart';
import '../../widget/AddEditServices/Button.dart';
import '../../widget/AddEditServices/buildImage.dart';
import '../../widget/AddEditServices/textFormField.dart';
import '../../widget/AddEditServices/heading.dart';
import '../../widget/AddEditServices/subheading.dart';
import '../../widget/AddEditServices/textFieldLabel.dart';

class EditServiceForm extends StatefulWidget {
  const EditServiceForm({super.key});

  @override
  State<EditServiceForm> createState() => _EditServiceFormState();
}

class _EditServiceFormState extends State<EditServiceForm> {
  final pagecontroller = Get.put(testController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.2),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.12,
              decoration: BoxDecoration(
                color: AppColors.appBar.withOpacity(0.2),
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                  child: serviceHeading(
                    title: 'Edit Services',
                    fontColor: AppColors.pink,
                    fontSize: Get.width * 0.07,
                    fontFamily: AppFonts.manrope,
                    fontWeight: AppFonts.extraBold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                  child: serviceSubHeading(
                    title:
                        "Follow the service adding rules while updating the service ",
                    fontColor: AppColors.grey,
                    fontFamily: AppFonts.manrope,
                    fontSize: Get.width * 0.03,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                SizedBox(height: Get.height * 0.06),
                const Label(title: 'Service Name'),
                const textFormField(),
                const Label(title: 'Description'),
                const textFormField(),
                const Label(title: 'Price Range'),
                const textFormField(),
                const Label(title: 'Number of Person'),
                const textFormField(),
                const Label(title: 'Service Images'),
                SizedBox(height: Get.height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(pagecontroller.selectedImage.length,
                      (index) => buildImage(index: index)),
                ),
                SizedBox(height: Get.height * 0.025),
                Button(
                    label: 'Save Changes',
                    width: Get.width * 0.45,
                    height: Get.height * 0.06,
                    buttonColor: AppColors.pink,
                    fontSize: Get.width * 0.05,
                    borderRadius: 16.0)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
