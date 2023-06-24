import 'package:flutter/material.dart';

import '../../widget/Orders/order_Card.dart';

class complete_order extends StatelessWidget {
  const complete_order({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return order_card();
      },
    );
  }
}
