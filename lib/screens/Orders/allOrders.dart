import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/controller/pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/Orders/dropdownmenu.dart';
import '../../widget/Orders/order_Card.dart';

class All_orders extends StatelessWidget {
  All_orders({super.key});

  final orderController = Get.put(OrderController());
  final pagecontroller = Get.put(testController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // dropdownmenu(),
        Expanded(
          child: ListView.builder(
            itemCount: orderController.idToGetOrders.length,
            itemBuilder: (context, index) {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Orders')
                      .doc(orderController.idToGetOrders[index])
                      .collection('bookings')
                      // .where('status', isEqualTo: 'Completed')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = snapshot.data!.docs[index];
                          print(doc.data());
                          return InkWell(
                            onTap: () {
                              pagecontroller.orderTabs.value = false;
                              Timestamp firestoreTimestamp =
                                  doc['Date of Delivery'];
                              DateTime dueDate = firestoreTimestamp.toDate();
                              Timestamp orderPlaceDate =
                                  Timestamp.fromMillisecondsSinceEpoch(
                                      doc['order placed']);
                              DateTime orderPlace = orderPlaceDate.toDate();

                              orderController.serviceName.value =
                                  doc['Service Name'];
                              orderController.orderId.value = doc['Order No'];
                              orderController.servicePrice.value =
                                  doc['Service Price'];
                              orderController.startTime.value =
                                  doc['Start time'];
                              orderController.endTime.value = doc['End time'];
                              orderController.customerName.value =
                                  doc['Customer Name'];
                              orderController.location.value = doc['location'];
                              if (doc['status'] == 'active') {
                                orderController.orderStatusOnHeader[0] = true;
                                orderController.orderStatusOnHeader[1] = false;
                              } else if (doc['status'] == 'Completed') {
                                orderController.orderStatusOnHeader[0] = true;
                                orderController.orderStatusOnHeader[1] = true;
                              }
                              Get.toNamed('/orderDetails', arguments: [
                                dueDate,
                                orderPlace,
                              ]);
                            },
                            child: order_card(
                              orderStatus: doc['status'] == 'active'
                                  ? "active"
                                  : "Complete",
                              bookedServiceName: doc['Service Name'],
                              orderNo: doc['Order No'],
                              servicePrice: doc['Service Price'],
                              timeOfService:
                                  "${doc['Start time']} - ${doc['End time']}",
                              userName: doc['Customer Name'],
                            ),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  });
            },
          ),
        ),
      ],
    );
  }
}
