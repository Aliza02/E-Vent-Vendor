import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventually_vendor/controller/order_controller.dart';
import 'package:eventually_vendor/firebaseMethods/userAuthentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/colors.dart';
import '../../constants/font.dart';
import '../../models/chart_data.dart';
import '../manageAvailability/text.dart';

class chart extends StatefulWidget {
  const chart({super.key});

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  List<chart_data> data = [];

  final orderController = Get.put(OrderController());
  double month = 1;
  double price = 0;

  Future<void> getChartData() async {
    // await FirebaseFirestore.instance.collection('Orders').get().then((value) {
    //   value.docs.forEach((element) async {
    //     if (element.id.contains(auth.currentUser!.uid)) {
    //       orderController.userOrderDocId.value = element.id;
    //       print(element.id);
    //     }
    //   });
    // });
    // if (orderController.userOrderDocId.value.isNotEmpty) {
    //   await FirebaseFirestore.instance
    //       .collection('Orders')
    //       .doc(orderController.userOrderDocId.value)
    //       .collection('bookings')
    //       .get()
    //       .then((value) {
    //     value.docs.forEach((element) {
    //       if (element.data()['Service Price'].toString().contains('-')) {
    //         print('cart if');
    //         List<String> parts =
    //             element.data()['Service Price'].toString().split('-');
    //         int part1 = int.parse(parts[0]);
    //         int part2 = int.parse(parts[1]);
    //         price = (part1 + part2) / 2;
    //         print(price);
    //         data.add(chart_data(price, month));
    //         month++;
    //       } else {
    //         double price = double.parse(element.data()['Service Price']);
    //         data.add(chart_data(price, month));
    //         print(price);
    //         month++;
    //       }
    //     });
    //   });
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getChartData();
    print(data.length);
    data = [
      chart_data(1500, 1),
      chart_data(1700, 2),
      chart_data(1567, 3),
      chart_data(2500, 4),
      chart_data(2580, 5),
      chart_data(3050, 6),
      chart_data(3100, 7),
      chart_data(2565, 8),
      chart_data(3400, 9),
      chart_data(3987, 10),
      chart_data(4248, 11),
      chart_data(4098, 12),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04,
              vertical: Get.height * 0.02,
            ),
            child: text(
              title: 'Sales Report',
              fontSize: Get.width * 0.04,
              fontWeight: AppFonts.bold,
              fontColor: AppColors.grey,
            ),
          ),
          FutureBuilder(
              future: getChartData(),
              builder: (context, snapshot) {
                return SizedBox(
                  height: Get.height * 0.3,
                  child: SfCartesianChart(
                    primaryXAxis: NumericAxis(
                      minimum: 1,
                      maximum: 12,
                      interval: 1,
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 1000,
                      maximum: 12000,
                      interval: 1000,
                    ),
                    series: <ChartSeries>[
                      SplineAreaSeries<chart_data, double>(
                        splineType: SplineType.natural,
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF5F4392).withOpacity(0.3),
                            const Color(0xFF5F4392).withOpacity(0.3),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        dataSource: data,
                        xValueMapper: (chart_data data, _) => data.month,
                        yValueMapper: (chart_data data, _) => data.price,
                      ),
                      SplineSeries<chart_data, double>(
                        color: const Color.fromARGB(255, 181, 126, 190),
                        width: 3,
                        dataSource: data,
                        xValueMapper: (chart_data data, _) => data.month,
                        yValueMapper: (chart_data data, _) => data.price,
                        markerSettings: const MarkerSettings(
                          color: Colors.deepPurple,
                          isVisible: true,
                          width: 2,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
