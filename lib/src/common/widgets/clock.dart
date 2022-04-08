import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pavlok_ui_task/src/utils/assets.dart';
import 'package:pavlok_ui_task/src/utils/colors.dart';
import 'package:pavlok_ui_task/src/utils/spacers.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    Key? key,
    required this.isFirst,
  }) : super(key: key);

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hours = isFirst ? '6' : '11';
    final minutes = isFirst ? '30' : '00';
    return Container(
      width: 220.w,
      height: 220.h,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Center(
            child: SvgPicture.asset(
              Assets.clockStack0,
              width: 220.w,
              height: 220.h,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              Assets.clockStack1,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              Assets.clockStack2,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              Assets.clockStack3,
            ),
          ),
          Positioned(
            top: -11,
            right: -18,
            child: isFirst
                ? Image.asset(Assets.clockStack4a)
                : Image.asset(Assets.clockStack4b),
          ),
          Positioned(
            top: 5.h,
            right: 97.68.w,
            child: Container(
              width: 24.64.w,
              height: 24.64.h,
              decoration: BoxDecoration(
                color: AppColors.dragIconColor,
                borderRadius: BorderRadius.circular(12.32.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  Assets.bedtimeIcon,
                  width: 17.75.w,
                  height: 17.75.h,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          isFirst
              ? Positioned(
                  right: 3.w,
                  top: 105.h,
                  child: Container(
                    width: 24.64.w,
                    height: 24.64.h,
                    decoration: BoxDecoration(
                      color: AppColors.dragIconColor,
                      borderRadius: BorderRadius.circular(12.32.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.wakeupIcon,
                        width: 17.75.w,
                        height: 17.75.h,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              : Positioned(
                  right: 69.w,
                  bottom: 7.50.h,
                  child: Container(
                    width: 24.64.w,
                    height: 24.64.h,
                    decoration: BoxDecoration(
                      color: AppColors.dragIconColor,
                      borderRadius: BorderRadius.circular(12.32.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.wakeupIcon,
                        width: 17.75.w,
                        height: 17.75.h,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${hours}hrs',
                  style: theme.textTheme.headline5!.copyWith(
                    color: AppColors.primaryDarkColor,
                    fontSize: 21.73.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacers.verticalSpacer(height: 0.77),
                Text(
                  '${minutes}min',
                  style: theme.textTheme.subtitle1!.copyWith(
                    color: AppColors.black,
                    fontSize: 11.7.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
