import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacers {
  // screen size
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // sized box that takes a certain percentage of the screen width
  static Widget screenHeightPercent(
    BuildContext context, {
    double percent = 1,
  }) =>
      SizedBox(height: screenHeight(context) * percent);

  static Widget screenWidthPercent(
    BuildContext context, {
    double percent = 1,
  }) =>
      SizedBox(width: screenWidth(context) * percent);

  static Widget verticalSpacer({required double height}) =>
      SizedBox(height: height.h);
  static Widget horizontalSpacer({required double width}) =>
      SizedBox(width: width.w);
}
