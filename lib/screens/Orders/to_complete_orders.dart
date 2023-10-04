import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/pagecontroller.dart';
import '../../widget/Orders/order_Card.dart';

class toComplete extends StatelessWidget {
  toComplete({super.key});
  final pagecontroller = Get.put(testController());
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderController.idToGetOrders.length,
      itemBuilder: (context, index) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Orders')
                .doc(orderController.idToGetOrders[index])
                .collection('bookings')
                .where('status', isEqualTo: 'active')
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

                    print(doc['order placed']);
                    return InkWell(
                      onTap: () {
                        pagecontroller.orderTabs.value = false;
                        Timestamp firestoreTimestamp = doc['Date of Delivery'];
                        DateTime dueDate = firestoreTimestamp.toDate();
                        Timestamp orderPlaceDate =
                            Timestamp.fromMillisecondsSinceEpoch(
                                doc['order placed']);
                        DateTime orderPlace = orderPlaceDate.toDate();

                        orderController.serviceName.value = doc['Service Name'];
                        orderController.orderId.value = doc['Order No'];
                        orderController.servicePrice.value =
                            doc['Service Price'];
                        orderController.startTime.value = doc['Start time'];
                        orderController.endTime.value = doc['End time'];
                        orderController.customerName.value =
                            doc['Customer Name'];
                        orderController.location.value = doc['location'];
                        orderController.orderStatusOnHeader[0] = true;
                        orderController.orderStatusOnHeader[1] = false;
                        Get.toNamed('/orderDetails', arguments: [
                          dueDate,
                          orderPlace,
                        ]);
                      },
                      child: order_card(
                        orderStatus: 'active',
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
    );
  }
}
