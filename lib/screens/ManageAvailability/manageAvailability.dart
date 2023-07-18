import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widget/manageAvailability/header.dart';

class manageAvailability extends StatelessWidget {
  const manageAvailability({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            header(),
          ],
        ),
      ),
    );
  }
}
