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
  late List<chart_data> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      chart_data(15000, 1),
      chart_data(17000, 2),
      chart_data(15670, 3),
      chart_data(25000, 4),
      chart_data(25800, 5),
      chart_data(30500, 6),
      chart_data(31000, 7),
      chart_data(25650, 8),
      chart_data(34000, 9),
      chart_data(39870, 10),
      chart_data(42480, 11),
      chart_data(40980, 12),
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
          Container(
            height: Get.height * 0.3,
            child: SfCartesianChart(
              primaryXAxis: NumericAxis(
                minimum: 1,
                maximum: 12,
                interval: 1,
              ),
              primaryYAxis: NumericAxis(
                minimum: 10000,
                maximum: 45000,
                interval: 5000,
              ),
              series: <ChartSeries>[
                SplineAreaSeries<chart_data, double>(
                  splineType: SplineType.natural,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5F4392).withOpacity(0.3),
                      Color(0xFF5F4392).withOpacity(0.3),
                      // Color.fromARGB(255, 192, 158, 198),
                      // Color.fromARGB(255, 229, 187, 236),
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
          ),
        ],
      ),
    );
  }
}
