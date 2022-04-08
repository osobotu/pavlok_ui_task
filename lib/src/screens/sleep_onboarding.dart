import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pavlok_ui_task/src/common/widgets/app_button.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:pavlok_ui_task/src/common/widgets/clock.dart';
import 'package:pavlok_ui_task/src/utils/assets.dart';
import 'package:pavlok_ui_task/src/utils/colors.dart';
import 'package:pavlok_ui_task/src/utils/spacers.dart';

class SleepOnboarding extends StatefulWidget {
  const SleepOnboarding({Key? key}) : super(key: key);

  @override
  State<SleepOnboarding> createState() => _SleepOnboardingState();
}

class _SleepOnboardingState extends State<SleepOnboarding> {
  bool isFirst = true;
  bool mondaySelected = true;
  bool tuesdaySelected = false;
  bool wednesdaySelected = false;
  bool thursdaySelected = false;
  bool fridaySelected = false;
  bool saturdaySelected = true;
  bool sundaySelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Spacers.verticalSpacer(height: 60),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    Assets.arrowLeftIcon,
                  ),
                ),
              ],
            ),
            Spacers.verticalSpacer(height: 20.45),
            Text(
              "Set bedtime and wake up",
              style: theme.textTheme.headline3!.copyWith(
                height: 33 / 23,
                color: AppColors.black,
              ),
            ),
            Spacers.verticalSpacer(height: 24),
            GestureDetector(
              onTap: () {
                // TODO Implement how the clock face changes
                setState(() {
                  isFirst = !isFirst;
                });
              },
              child: ClockWidget(
                isFirst: isFirst,
              ),
            ),
            Spacers.verticalSpacer(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.unionIcon,
                  width: 18.w,
                  height: 18.h,
                ),
                Spacers.horizontalSpacer(width: 8),
                Text(
                  isFirst
                      ? "Under your sleep goal ( 8hrs )"
                      : 'Over your sleep goal ( 8hrs )',
                  style: theme.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Spacers.verticalSpacer(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        Assets.bedtimeIcon,
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                    Spacers.horizontalSpacer(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bedtime",
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacers.verticalSpacer(height: 4),
                        Text(
                          "12:00 AM",
                          style: theme.textTheme.headline5!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        Assets.wakeupIcon,
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                    Spacers.horizontalSpacer(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wake up",
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacers.verticalSpacer(height: 4),
                        Text(
                          isFirst ? "6:30 AM" : '11:00 AM',
                          style: theme.textTheme.headline5!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Spacers.verticalSpacer(height: 24),
            Container(
              width: 312.w,
              height: 103.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.w, -14.h),
                    blurRadius: 40.0.r,
                    color: AppColors.white,
                  ),
                  BoxShadow(
                    offset: Offset(0.w, 14.h),
                    blurRadius: 40.0.r,
                    color: AppColors.listItemShadowColor,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 16.h),
                    child: SizedBox(
                      width: 96.w,
                      height: 19.h,
                      child: Text(
                        'Repeat days',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: AppColors.baseBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Spacers.verticalSpacer(height: 16),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.w,
                      bottom: 16.h,
                      right: 12.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RepeatDaysWidget(
                          day: 'M',
                          isSelected: mondaySelected,
                          onTap: () {
                            setState(() {
                              mondaySelected = !mondaySelected;
                            });
                          },
                        ),
                        RepeatDaysWidget(
                          day: 'T',
                          isSelected: tuesdaySelected,
                          onTap: () {
                            setState(() {
                              tuesdaySelected = !tuesdaySelected;
                            });
                          },
                        ),
                        RepeatDaysWidget(
                          day: 'W',
                          isSelected: wednesdaySelected,
                          onTap: () {
                            setState(() {
                              wednesdaySelected = !wednesdaySelected;
                            });
                          },
                        ),
                        RepeatDaysWidget(
                          day: 'T',
                          isSelected: thursdaySelected,
                          onTap: () {
                            setState(() {
                              thursdaySelected = !thursdaySelected;
                            });
                          },
                        ),
                        RepeatDaysWidget(
                          day: 'F',
                          isSelected: fridaySelected,
                          onTap: () {
                            setState(() {
                              fridaySelected = !fridaySelected;
                            });
                          },
                        ),
                        RepeatDaysWidget(
                          day: 'S',
                          isSelected: saturdaySelected,
                          onTap: () {
                            setState(() {
                              saturdaySelected = !saturdaySelected;
                            });
                          },
                        ),
                        RepeatDaysWidget(
                          day: 'S',
                          isSelected: sundaySelected,
                          onTap: () {
                            setState(() {
                              sundaySelected = !sundaySelected;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacers.verticalSpacer(height: 16),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.36),
                        topRight: Radius.circular(15.36),
                      ),
                    ),
                    backgroundColor: AppColors.white,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 437.h,
                        child: Column(
                          children: [
                            Spacers.verticalSpacer(height: 16),
                            Container(
                              width: 30.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: BorderRadius.circular(96.r),
                              ),
                            ),
                            Spacers.verticalSpacer(height: 24),
                            Text(
                              'Reminder',
                              style: theme.textTheme.headline3,
                            ),
                            Spacers.verticalSpacer(height: 33.8),
                            Text(
                              '20',
                              style: theme.textTheme.bodyText1!.copyWith(
                                fontSize: 17.sp,
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacers.verticalSpacer(height: 20.6),
                            Text(
                              '25',
                              style: theme.textTheme.bodyText1!.copyWith(
                                fontSize: 20.sp,
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacers.verticalSpacer(height: 8.67),
                            const Divider(
                              color: AppColors.dividerColor,
                            ),
                            Spacers.verticalSpacer(height: 8.43),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 165.w, right: 90.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '30',
                                      style:
                                          theme.textTheme.headline3!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacers.horizontalSpacer(width: 36),
                                    Text(
                                      'min',
                                      style:
                                          theme.textTheme.headline3!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacers.verticalSpacer(height: 8.21),
                            const Divider(
                              color: AppColors.dividerColor,
                            ),
                            Spacers.verticalSpacer(height: 8.89),
                            Text(
                              '35',
                              style: theme.textTheme.bodyText1!.copyWith(
                                fontSize: 20.sp,
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacers.verticalSpacer(height: 20.6),
                            Text(
                              '40',
                              style: theme.textTheme.bodyText1!.copyWith(
                                fontSize: 17.sp,
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacers.verticalSpacer(height: 41.8),
                            AppButton(
                              text: 'Done',
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                width: 312.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.w, -14.h),
                      blurRadius: 40.0.r,
                      color: AppColors.white,
                    ),
                    BoxShadow(
                      offset: Offset(0.w, 14.h),
                      blurRadius: 40.0.r,
                      color: AppColors.listItemShadowColor,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 0.h, 22.w, 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Remind me before bed time",
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "30 min",
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacers.verticalSpacer(height: 60),
            AppButton(
              text: 'Next',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatDaysWidget extends StatelessWidget {
  const RepeatDaysWidget({
    Key? key,
    required this.day,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);
  final String day;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: AppColors.primaryColor,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 20,
                    color: AppColors.buttonDropShadowColor,
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor,
                    AppColors.secondGradientColor,
                  ],
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: AppColors.dividerColor,
              ),
        child: Center(
          child: Text(
            day,
            style: theme.textTheme.bodyText1!.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
