import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:eventually_vendor/widget/dashboard.dart/reviewContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../constants/icons.dart';
import '../manageAvailability/text.dart';

class review extends StatefulWidget {
  const review({super.key});

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  final orderController = Get.put(OrderController());
  List<String> reviews = [];
  List<int> ratings = [];
  int colorindex = 0;

  // late Future<void> future;
  int part1 = 0;
  Future<void> getUserId() async {
    reviews.clear();

    await FirebaseFirestore.instance.collection('Orders').get().then((value) {
      value.docs.forEach((element) async {
        print(element.id);
        if (element.id.contains(auth.currentUser!.uid)) {
          orderController.userOrderDocId.value = element.id;
        }
      });
    });

    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(orderController.userOrderDocId.value)
        .collection('bookings')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        reviews.add(element.data()['review']);
        if (element.data()['rating'].toString().contains('.')) {
          List<String> parts = element.data()['rating'].toString().split('.');
          part1 = int.parse(parts[0]);
        }
        ratings.add(part1);
      });
    });
  }

  void initState() {
    super.initState();
    // future=getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3FDF4E52),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.015),
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
            child: text(
              title: 'Recent Reviews',
              fontColor: AppColors.grey,
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
            ),
          ),
          FutureBuilder(
            future: getUserId(),
            builder: (context, snapshot) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  // DocumentSnapshot ds = snapshot.data!.docs[index];
                  // print(ds.data());
                  if (colorindex > 2) {
                    colorindex = 0;
                  }
                  return reviews.isNotEmpty
                      ? reviewContainer(
                          ratings: ratings[index],
                          colorIndex: colorindex++,
                          review: reviews[index],
                        )
                      : CircularProgressIndicator();
                },
              );
            },
          ),
          // InkWell(
          //   onTap: () {
          //     Get.toNamed('/order');
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(
          //       left: Get.width * 0.07,
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         text(
          //           title: 'View more',
          //           fontSize: Get.width * 0.035,
          //           fontWeight: AppFonts.bold,
          //           fontColor: AppColors.pink,
          //         ),
          //         Container(
          //           margin: EdgeInsets.only(top: Get.height * 0.01),
          //           padding: const EdgeInsets.only(top: 10.0),
          //           child: SvgPicture.asset(
          //             AppIcons.orderStatsArrow,
          //             height: 20.0,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
