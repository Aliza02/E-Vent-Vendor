import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../controller/pagecontroller.dart';
import '../../controller/services.dart';
import '../../firebaseMethods/addService.dart';

class bottomNavBar extends StatelessWidget {
  bottomNavBar({super.key});
  final pagecontroller = Get.put(testController());
  final servicecontroller = Get.put(serviceController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.08,
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(
                color: AppColors.pink,
                width: 2.0,
              ),
            ),
            gradient: LinearGradient(colors: [
              AppColors.white.withOpacity(0.1),
              AppColors.pink.withOpacity(0.2),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            width: Get.width,
            margin: EdgeInsets.only(top: Get.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(0);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 0
                          ? SvgPicture.asset(AppIcons.homeFill)
                          : SvgPicture.asset(AppIcons.home),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(1);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 1
                          ? SvgPicture.asset(AppIcons.messageFill)
                          : SvgPicture.asset(AppIcons.message),
                    )),
                IconButton(
                    onPressed: () async {
                      pagecontroller.changeIndex(2);

                      // await firestore
                      //     .collection('Services')
                      //     .doc('Photographer')
                      //     .collection(auth.currentUser!.uid.toString())
                      //     .doc('Silver Package')
                      //     .set(
                      //   {
                      //     'Service Name': 'Silver Package',
                      //     'Service Description':
                      //         '100 copies of 4x6 photos and 1 album of 26 pages',
                      //     'Service Price': '1k-2k',
                      //     'NoOfPerson': 0,
                      //     'image1': '',
                      //     'image2': ' ',
                      //     'image3': ' ',
                      //   },
                      // );

                      // await FirebaseFirestore.instance
                      //     .collection("Services")
                      //     .doc('BqrU80Zcd5PnosXngI8yLwhLQvX2')
                      //     .collection('ibad')
                      //     .get()
                      //     .then((value) => {
                      //           value.docs.forEach((element) {
                      //             print(element.data());
                      //             print(element.id);
                      //           })
                      //         });

                      // var result = await FirebaseFirestore.instance
                      //     .collection('Services')
                      //     .get();

                      // print(result.docs.length);

                      // await FirebaseFirestore.instance
                      //     .collection('test')
                      //     .get()
                      //     .then((value) => {
                      //           value.docs.forEach((element) {
                      //             print(element.id);
                      //             print(element.data());
                      //           })
                      //         });
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 2
                          ? SvgPicture.asset(AppIcons.addButtonFill)
                          : SvgPicture.asset(AppIcons.addButton),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(3);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 3
                          ? SvgPicture.asset(AppIcons.calendarFill)
                          : SvgPicture.asset(AppIcons.calender),
                    )),
                IconButton(
                    onPressed: () {
                      pagecontroller.changeIndex(4);
                    },
                    icon: Obx(
                      () => pagecontroller.currentindex.value == 4
                          ? SvgPicture.asset(AppIcons.profileFill)
                          : SvgPicture.asset(AppIcons.profile),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
