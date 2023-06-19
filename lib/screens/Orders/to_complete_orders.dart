import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/Orders/order_Card.dart';

class toComplete extends StatelessWidget {
  const toComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return order_card();
      },
    );
  }
}
