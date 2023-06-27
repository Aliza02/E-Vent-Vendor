import 'package:eventually_vendor/widget/Orders/order_header.dart';
import 'package:flutter/material.dart';

import '../../widget/Orders/order_details_header.dart';

class order_details extends StatelessWidget {
  const order_details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            order_Details_Header(),
          ],
        ),
      ),
    );
  }
}
