import 'package:eventually_vendor/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../widget/AddServices/heading.dart';
import '../../widget/AddServices/subheading.dart';
// import '../drawer/test.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.23,
                decoration: BoxDecoration(
                  color: AppColors.appBar.withOpacity(0.2),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: serviceHeading(
                      title: 'Add Service',
                      fontColor: AppColors.pink,
                      fontSize: width * 0.07,
                      fontFamily: AppFonts.manrope,
                      fontWeight: AppFonts.extraBold,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: serviceSubHeading(
                        title:
                            "For adding a service, fill all the filelds and follow the service adding rules",
                        fontColor: AppColors.grey,
                        fontFamily: AppFonts.manrope,
                        fontSize: width * 0.03,
                        fontWeight: AppFonts.bold,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    width: width * 0.86,
                    height: height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: AppColors.googleButtonBorder,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: width * 0.35,
                          height: height * 0.06,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppIcons.addInactive,
                            ),
                            label: Text('Edit'),
                          ),
                        ),
                        Container(
                          width: width * 0.35,
                          height: height * 0.06,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.addActive),
                            label: Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
