import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/message_controller.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../controller/firebaseController.dart';
import '../../firebaseMethods/addService.dart';
import '../../widget/dashboard.dart/chart.dart';
import '../../widget/dashboard.dart/order_stats_section.dart';
import '../../widget/dashboard.dart/review.dart';
import '../../widget/dashboard.dart/top_orders.dart';
import '../../widget/manageAvailability/text.dart';

class dashboard extends StatefulWidget {
  dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final firebasecontroller = Get.put(firebaseController());
  final _msgController = Get.put(MessageController());
  final orderController = Get.put(OrderController());
  final pagecontroller = Get.put(testController());
  void getResult() async {

  
    
    await FirebaseFirestore.instance.collection('messages').get().then((value) {
      value.docs.forEach((element) {
        print(element.id);

        if (element.id.contains(auth.currentUser!.uid)) {
          List<String> parts = element.id.split(auth.currentUser!.uid);
          if (parts[0].contains(auth.currentUser!.uid)) {
            print('oo');
            _msgController.chatUserId.add(parts[1]);
          } else {
            print('p');
            _msgController.chatUserId.add(parts[0]);
          }
        }
      });
    });
  }

  @override
  void initState() {
    final docRef = firestore.collection("User").doc(auth.currentUser!.uid);

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        final business = data['Business Category'];
        firebasecontroller.userId.value = data['userId'];
        firebasecontroller.businessCategory.value = data['Business Category'];
        firebasecontroller.businessName.value = data['Business Name'];
        firebasecontroller.location.value = data['Business Location'];
        firebasecontroller.phone.value = data['Phone'];
        firebasecontroller.userName.value = data['name'];
        firebasecontroller.profileImageLink.value = data['Profile image'];
        firebasecontroller.profileImageUploaded.value = true;

        // print(firebasecontroller.userId.value);
        servicecontroller.currentUserBusinessCategory.value = business;
        // print(business);
        // print(servicecontroller.currentUserBusinessCategory.value);
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );

    super.initState();
    _msgController.chatUserId.clear();
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
            vertical: Get.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.07),
                child: text(
                  title: "Welcome ${auth.currentUser!.displayName}",
                  fontColor: AppColors.grey,
                  fontSize: Get.width * 0.04,
                  fontWeight: AppFonts.regular,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: Get.width * 0.07),
                child: text(
                  title: "Your Dashboard",
                  fontColor: AppColors.pink,
                  fontSize: Get.width * 0.08,
                  fontWeight: AppFonts.extraBold,
                ),
              ),
              const chart(), // display chart
              SizedBox(
                height: Get.height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  order_stats_section(),
                  top_orders(),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const review(),
            ],
          ),
        ),
      ),
    );
  }
}
