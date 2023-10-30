import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/widget/BottomNavBar/bottomNavBar.dart';
import 'package:eventually_vendor/widget/dashboard.dart/reviewContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../controller/firebaseController.dart';
import '../../controller/pagecontroller.dart';
import '../../firebaseMethods/userAuthentication.dart';
import '../../widget/manageAvailability/heading.dart';
import '../../widget/manageAvailability/text.dart';
import '../../widget/profile/personalInfo.dart';
import '../../widget/profile/reviewerImage.dart';

class profileScreen extends StatefulWidget {
  profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final pagecontroller = Get.put(testController());
  List<String> reviews = [];
  List<int> ratings = [];
  int colorindex = 0;
  int noOfOrder = 0;
  final orderController = Get.put(OrderController());
  int part1 = 0;
  Future<void> getUserId() async {
    noOfOrder = 0;
    // reviews.clear();
    // ratings.clear();

    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        print(element.id);
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });
if(orderController.userOrderDocId.value.isNotEmpty){
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(orderController.userOrderDocId.value)
        .collection('bookings')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        noOfOrder++;
        // reviews.add(element.data()['review']);
        // print(noOfOrder);
        // if (element.data()['rating'].toString().contains('.')) {
        //   List<String> parts = element.data()['rating'].toString().split('.');
        //   part1 = int.parse(parts[0]);
        // }
        // ratings.add(part1);
      });
    });
}
  }

  Future<void> getReviewsRatings() async {
    reviews.clear();
    ratings.clear();

    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        print(element.id);
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });

if(orderController.userOrderDocId.value.isNotEmpty){
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(orderController.userOrderDocId.value)
        .collection('bookings')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        // noOfOrder++;
        reviews.add(element.data()['review']);
        print(noOfOrder);
        if (element.data()['rating'].toString().contains('.')) {
          List<String> parts = element.data()['rating'].toString().split('.');
          part1 = int.parse(parts[0]);
        }
        ratings.add(part1);
      });
    });
}
  }

  // Widget reviewContainer(BuildContext context, int index, int colorIndex) {
  //   return Container(
  //     width: Get.width * 0.8,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: Get.width * 0.05,
  //       vertical: Get.height * 0.01,
  //     ),
  //     decoration: BoxDecoration(
  //       color: AppColors.reviewsColor[colorIndex],
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         reviewerImage(index: 1),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: List.generate(
  //                 4,
  //                 (index) => Container(
  //                   margin: EdgeInsets.only(
  //                     left: Get.width * 0.001,
  //                     top: Get.height * 0.01,
  //                   ),
  //                   child: SvgPicture.asset(
  //                     AppIcons.star,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               width: Get.width * 0.7,
  //               padding: const EdgeInsets.only(bottom: 10.0),
  //               child: Text(
  //                 reviews[index],
  //                 style: TextStyle(
  //                   fontFamily: AppFonts.manrope,
  //                   fontSize: Get.width * 0.035,
  //                   fontWeight: AppFonts.medium,
  //                   color: AppColors.grey,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Settings', 'Switch Account', 'Logout'];
    final firebasecontroller = Get.put(firebaseController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.appBar.withOpacity(0.2),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        left: Get.width * 0.09,
                        // top: Get.height * 0.04,
                      ),
                      child: heading(title: 'Profile'),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: Get.height * 0.01,
                            left: Get.width * 0.07,
                          ),
                          padding: EdgeInsets.all(Get.width * 0.01),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            backgroundImage: NetworkImage(
                                firebasecontroller.profileImageLink.value),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Container(
                                margin: EdgeInsets.only(top: Get.height * 0.03),
                                child: text(
                                  title: firebasecontroller.businessName.value,
                                  fontColor: AppColors.grey,
                                  fontSize: Get.width * 0.07,
                                  fontWeight: AppFonts.bold,
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                margin: EdgeInsets.only(left: Get.width * 0.01),
                                child: text(
                                  title:
                                      firebasecontroller.businessCategory.value,
                                  fontColor: AppColors.grey.withOpacity(0.5),
                                  fontSize: Get.width * 0.04,
                                  fontWeight: AppFonts.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: Get.width * 0.01,
                                      top: Get.height * 0.001),
                                  child: text(
                                    title: 'Rating',
                                    fontSize: Get.width * 0.04,
                                    fontWeight: AppFonts.bold,
                                    fontColor: AppColors.grey,
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    4,
                                    (index) => Container(
                                      margin: EdgeInsets.only(
                                        left: Get.width * 0.001,
                                        top: Get.height * 0.001,
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.star,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: Get.height * 0.02,
                                left: Get.width * 0.07,
                              ),
                              child: text(
                                title: 'Personal Information',
                                fontSize: Get.width * 0.05,
                                fontWeight: AppFonts.extraBold,
                                fontColor: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/editprofile');
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: Get.height * 0.02,
                                right: Get.width * 0.04),
                            child: SvgPicture.asset(AppIcons.editPersonalInfo),
                          ),
                        ),
                      ],
                    ),

                    Obx(
                      () => personalInfo(
                        textTitle: firebasecontroller.userName.value,
                        fontSize: Get.width * 0.04,
                        icon: AppIcons.profileName,
                        height: Get.height * 0.02,
                      ),
                    ),

                    Obx(
                      () => personalInfo(
                        textTitle: firebasecontroller.phone.value,
                        fontSize: Get.width * 0.04,
                        icon: AppIcons.profilePhone,
                        height: Get.height * 0.02,
                      ),
                    ),

                    Obx(
                      () => personalInfo(
                        textTitle: firebasecontroller.location.value,
                        fontSize: Get.width * 0.04,
                        icon: AppIcons.profileLocation,
                        height: Get.height * 0.02,
                      ),
                    ),

                    Divider(
                      color: AppColors.pink.withOpacity(0.6),
                      height: 20.0,
                    ),

                    // congrats section
                    SizedBox(height: Get.height * 0.01),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              left: Get.width * 0.02,
                            ),
                            child: Image.asset(
                              AppImages.trophy,
                              height: Get.height * 0.1,
                              width: Get.width * 0.3,
                            )),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => text(
                                  title:
                                      "Congrats ${firebasecontroller.userName.value}",
                                  fontSize: Get.width * 0.055,
                                  fontWeight: AppFonts.extraBold,
                                  fontColor: AppColors.grey,
                                ),
                              ),
                              FutureBuilder(
                                  future: getUserId(),
                                  builder: (context, snapshot) {
                                    return RichText(
                                      text: TextSpan(
                                        text: "You've got ",
                                        style: TextStyle(
                                          fontFamily: AppFonts.manrope,
                                          fontWeight: AppFonts.medium,
                                          fontSize: Get.width * 0.035,
                                          color: AppColors.grey,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: noOfOrder.toString(),
                                            style: TextStyle(
                                              fontFamily: AppFonts.manrope,
                                              fontWeight: AppFonts.bold,
                                              fontSize: Get.width * 0.05,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' Orders from EventuAlly.',
                                            style: TextStyle(
                                              fontFamily: AppFonts.manrope,
                                              fontWeight: AppFonts.medium,
                                              fontSize: Get.width * 0.035,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              text(
                                title: "Keep Going!.",
                                fontSize: Get.width * 0.035,
                                fontWeight: AppFonts.medium,
                                fontColor: AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Divider(
                      color: AppColors.pink.withOpacity(0.6),
                      height: 20.0,
                    ),

                    // reviews section

                    Container(
                      margin: EdgeInsets.only(
                        top: Get.height * 0.01,
                        left: Get.width * 0.07,
                      ),
                      child: text(
                        title: 'Reviews',
                        fontSize: Get.width * 0.05,
                        fontWeight: AppFonts.extraBold,
                        fontColor: AppColors.grey,
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: FutureBuilder(
                            future: getReviewsRatings(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: reviews.length,
                                itemBuilder: (context, index) {
                                  if (colorindex > 2) {
                                    colorindex = 0;
                                  }
                                  return reviews.isNotEmpty
                                      ? reviewContainer(
                                          colorIndex: colorindex++,
                                          ratings: ratings[index],
                                          review: reviews[index],
                                        )
                                      : CircularProgressIndicator();
                                },
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
