import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/colors.dart';
// import '../drawer/test.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: AppColors.pink,
            size: 40.0,
            weight: 10.0,
          ),
          backgroundColor: AppColors.appBar.withOpacity(0.2),
        ),
        body: Column(children: [
          Container(
            height: 200.0,
            width: 500.0,
            decoration: BoxDecoration(
              color: AppColors.appBar.withOpacity(0.2),
            ),
            child: Text(
              'Add Services',
              style: TextStyle(color: AppColors.pink),
            ),
          ),
        ]),
      ),
    );
  }
}
