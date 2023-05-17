import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';

class progressbar extends StatefulWidget {
  int index = 0;
  progressbar({super.key, required this.index});

  @override
  State<progressbar> createState() => _progressbarState();
}

class _progressbarState extends State<progressbar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(widget.index.toString()),
            Row(
              children: [
                Container(
                    height: height * 0.03,
                    width: width * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(constant.red),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: widget.index >= 1
                        ? Text(widget.index.toString())
                        // Icon(
                        //     Icons.check,
                        //     color: Color(constant.red),
                        //     size: 16.0,
                        //   )
                        : Text(widget.index.toString())
                    // Icon(
                    //     Icons.circle,
                    //     color: Color(constant.red),
                    //     size: 16.0,
                    //   ),
                    ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.003),
                  height: height * 0.001,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: height * 0.03,
                  width: width * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          widget.index == 0 ? Colors.grey : Color(constant.red),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: Color(constant.background),
                  ),
                  child: widget.index >= 1
                      ? Text(widget.index.toString())
                      // Icon(
                      //     Icons.circle,
                      //     color: Color(constant.red),
                      //   )
                      : Container(),
                ),
              ],
            ),
            Container(
              width: width * 0.82,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(
                      fontFamily: constant.font,
                      fontSize: width * 0.04,
                      fontWeight: widget.index == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Business',
                    style: TextStyle(
                      fontFamily: constant.font,
                      fontSize: width * 0.04,
                      fontWeight: widget.index == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
