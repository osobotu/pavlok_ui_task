import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pavlok_ui_task/src/utils/assets.dart';
import 'package:pavlok_ui_task/src/utils/colors.dart';
import 'package:pavlok_ui_task/src/utils/spacers.dart';

class MainGoalScreen extends StatefulWidget {
  const MainGoalScreen({Key? key}) : super(key: key);

  @override
  State<MainGoalScreen> createState() => _MainGoalScreenState();
}

class _MainGoalScreenState extends State<MainGoalScreen> {
  int tabIndex = 0;

  final List<String> _goodHabits = [
    'Set bedtime and wake up',
    'Take a walk',
    'Stay hydrated',
    'Call parents',
    'Donate to charity',
  ];

  final List<String> _goodHabitsIcons = [
    Assets.sleepIcon,
    Assets.walkIcon,
    Assets.bottleIcon,
    Assets.callIcon,
    Assets.donateIcon,
  ];

  final List<String> _badHabits = [
    "Can't wake up",
    "Getting lazy for workout",
    "Forgetting to drink water",
    "Spending on credit cards",
  ];

  int goodHabitsIndex = 0;
  int badHabitsIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacers.verticalSpacer(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            width: 184.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(55.r),
                              ),
                            ),
                          ),
                          Container(
                            width: 46.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: AppColors.yellowColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(55.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacers.horizontalSpacer(width: 24),
                    SizedBox(
                      width: 34.w,
                      child: Text(
                        '1 of 4',
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: AppColors.secondaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Spacers.horizontalSpacer(width: 24),
                  ],
                ),
                Spacers.verticalSpacer(height: 32),
                SizedBox(
                  width: 312.w,
                  height: 40.h,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "What’s your main goal?",
                      style: theme.textTheme.headline3,
                    ),
                  ),
                ),
                // Spacers.verticalSpacer(height: 9),
                SizedBox(
                  width: 312.w,
                  height: 24.h,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Let’s start with one of these habits. ",
                      style: theme.textTheme.headline4,
                    ),
                  ),
                ),
                Spacers.verticalSpacer(height: 43),
                TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  labelStyle: theme.textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.secondaryColor,
                  unselectedLabelStyle: theme.textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: AppColors.primaryColor,
                  onTap: (value) {
                    setState(() {
                      tabIndex = value;
                    });
                  },
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            Assets.leafIcon,
                            color: tabIndex == 0
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                          ),
                          const Text("Start a good habit")
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            Assets.shockIcon,
                            color: tabIndex == 1
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                          ),
                          const Text("Break a bad habit")
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    color: Colors.white24,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _goodHabits.length,
                            itemBuilder: (context, index) {
                              bool selectedGoodHabit = index == goodHabitsIndex;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    goodHabitsIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 312.w,
                                  height: 72.h,
                                  decoration: selectedGoodHabit
                                      ? BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: AppColors.listItemIconColor,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 8),
                                                blurRadius: 10.0,
                                                color:
                                                    AppColors.listItemIconColor)
                                          ],
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 8),
                                                blurRadius: 10.0,
                                                color:
                                                    AppColors.listItemIconColor)
                                          ],
                                        ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 56.w,
                                          height: 56.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: AppColors.listItemIconColor,
                                          ),
                                        ),
                                        Spacers.horizontalSpacer(width: 12),
                                        Expanded(
                                          child: Text(
                                            _goodHabits[index],
                                            style: selectedGoodHabit
                                                ? theme.textTheme.bodyText1!
                                                    .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                : theme.textTheme.bodyText1!
                                                    .copyWith(
                                                    color:
                                                        AppColors.mainTextColor,
                                                  ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Spacers.verticalSpacer(height: 12);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _badHabits.length,
                            itemBuilder: (context, index) {
                              bool selectedBadHabit = index == badHabitsIndex;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    badHabitsIndex = index;
                                  });
                                },
                                child: Container(
                                  width: 312.w,
                                  height: 72.h,
                                  decoration: selectedBadHabit
                                      ? BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: AppColors.listItemIconColor,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 8),
                                                blurRadius: 10.0,
                                                color:
                                                    AppColors.listItemIconColor)
                                          ],
                                        )
                                      : BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 8),
                                                blurRadius: 10.0,
                                                color:
                                                    AppColors.listItemIconColor)
                                          ],
                                        ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 56.w,
                                          height: 56.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            color: AppColors.listItemIconColor,
                                          ),
                                        ),
                                        Spacers.horizontalSpacer(width: 12),
                                        Expanded(
                                          child: Text(
                                            _badHabits[index],
                                            style: selectedBadHabit
                                                ? theme.textTheme.bodyText1!
                                                    .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight: FontWeight.w600,
                                                  )
                                                : theme.textTheme.bodyText1!
                                                    .copyWith(
                                                    color:
                                                        AppColors.mainTextColor,
                                                  ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Spacers.verticalSpacer(height: 12);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacers.verticalSpacer(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.r),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primaryColor,
                          AppColors.secondGradientColor,
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 10.0,
                          color: AppColors.buttonShadowColor,
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: AppColors.buttonShadowColor,
                        primary: Colors.transparent,
                        elevation: 20.0,
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ),
                  ),
                ),
                Spacers.verticalSpacer(height: 15),
              ],
            ),
          );
        },
      ),
    );
  }
}
