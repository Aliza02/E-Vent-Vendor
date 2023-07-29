import 'package:eventually_vendor/widget/BottomNavBar/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../controller/pagecontroller.dart';
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

  List<String> reviews = [
    "Very Nice Services",
    "Had Bad Experience",
    "Highly recommended!! Everything went smooth and everyone praised the setting."
  ];

  Widget reviewContainer(BuildContext context, int index, int colorIndex) {
    return Container(
      width: Get.width * 0.8,
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * 0.05,
        vertical: Get.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: AppColors.reviewsColor[colorIndex],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reviewerImage(index: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      left: Get.width * 0.001,
                      top: Get.height * 0.01,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.star,
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.7,
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  reviews[index],
                  style: TextStyle(
                    fontFamily: AppFonts.manrope,
                    fontSize: Get.width * 0.035,
                    fontWeight: AppFonts.medium,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Settings', 'Switch Account', 'Logout'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar.withOpacity(0.2),
          elevation: 0.0,
          actions: [
            PopupMenuButton(
              icon: SvgPicture.asset(AppIcons.profileMenuIcon),
              color: AppColors.cream,
              itemBuilder: (BuildContext context) {
                return options.map((String option) {
                  return PopupMenuItem(
                    onTap: () {
                      print(options.indexOf(option));
                    },
                    child: Text(option),
                  );
                }).toList();
              },
            ),
          ],
        ),
        // bottomNavigationBar: bottomNavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
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
                          child: const CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/profileimage.png'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: Get.height * 0.03),
                              child: text(
                                title: 'Sari Banquet',
                                fontColor: AppColors.grey,
                                fontSize: Get.width * 0.07,
                                fontWeight: AppFonts.bold,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: Get.width * 0.01),
                              child: text(
                                title: 'Business Category',
                                fontColor: AppColors.grey.withOpacity(0.5),
                                fontSize: Get.width * 0.04,
                                fontWeight: AppFonts.bold,
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
                        Container(
                            margin: EdgeInsets.only(
                                top: Get.height * 0.02,
                                right: Get.width * 0.04),
                            child: SvgPicture.asset(AppIcons.editPersonalInfo)),
                      ],
                    ),
                    personalInfo(
                      textTitle: 'UserName',
                      fontSize: Get.width * 0.04,
                      icon: AppIcons.profileName,
                      height: Get.height * 0.02,
                    ),
                    personalInfo(
                      textTitle: 'UserPhone',
                      fontSize: Get.width * 0.04,
                      icon: AppIcons.profilePhone,
                      height: Get.height * 0.02,
                    ),
                    personalInfo(
                      textTitle: 'UserLocation',
                      fontSize: Get.width * 0.04,
                      icon: AppIcons.profileLocation,
                      height: Get.height * 0.02,
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
                              text(
                                title: 'Congrates UserName!',
                                fontSize: Get.width * 0.055,
                                fontWeight: AppFonts.extraBold,
                                fontColor: AppColors.grey,
                              ),
                              RichText(
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
                                      text: '78',
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
                              ),
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
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return reviewContainer(context, index, index);
                          },
                        ),
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
