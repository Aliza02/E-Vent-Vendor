import 'package:flutter/material.dart';

import '../../widget/Orders/dropdownmenu.dart';
import '../../widget/Orders/order_Card.dart';

class All_orders extends StatelessWidget {
  const All_orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dropdownmenu(),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return order_card();
          },
        ),
      ],
    );
  }
}
