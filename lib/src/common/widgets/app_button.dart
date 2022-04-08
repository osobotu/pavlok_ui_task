import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pavlok_ui_task/src/utils/colors.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 312.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.secondGradientColor,
                AppColors.primaryColor,
              ],
              stops: [
                0.0,
                1.0,
              ]),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.w, 8.h),
              color: AppColors.buttonDropShadowColor,
              blurRadius: 20.r,
            ),
            BoxShadow(
              color: AppColors.primaryDarkColor,
              offset: Offset(0.w, -3.h),
              blurRadius: 1.r,
              inset: true,
            ),
            BoxShadow(
              offset: Offset(0.w, 0.h),
              color: AppColors.buttonInnerShadowColor1,
              blurRadius: 2.r,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: theme.textTheme.bodyText1!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
