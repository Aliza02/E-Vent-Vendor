import 'package:flutter/material.dart';

import '../../widget/Orders/order_Card.dart';

class toComplete extends StatelessWidget {
  const toComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return order_card();
      },
    );
  }
}
