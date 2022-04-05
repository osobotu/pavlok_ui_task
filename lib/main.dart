import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pavlok_ui_task/src/screens/main_goal.dart';
import 'package:pavlok_ui_task/src/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: () {
          return MaterialApp(
            title: 'Pavlok UI task',
            debugShowCheckedModeBanner: false,
            theme: PavlokTheme.light(),
            home: const MainGoalScreen(),
          );
        });
  }
}
