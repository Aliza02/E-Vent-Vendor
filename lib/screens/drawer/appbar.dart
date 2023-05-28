import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../constants/colors.dart';

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: AppColors.appBar.withOpacity(0.2),
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            ZoomDrawer.of(context)?.toggle();
          },
          child: Icon(
            Icons.menu,
            color: AppColors.pink,
            size: 40.0,
            weight: 10.0,
          ),
        ),
      ),
    );
  }
}
