import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class PavlokTheme {
  static final TextTheme _lightTextTheme = GoogleFonts.manropeTextTheme(
    TextTheme(
      headline3: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.mainTextColor,
      ),
      headline4: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.mainTextColor,
      ),
      headline5: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.mainTextColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16.sp,
        color: AppColors.mainTextColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14.sp,
        color: AppColors.mainTextColor,
      ),
      subtitle1: TextStyle(
        fontSize: 12.sp,
        color: AppColors.mainTextColor,
      ),
    ),
  );

  static final TextButtonThemeData? _textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      textStyle: MaterialStateProperty.all<TextStyle>(
          _lightTextTheme.bodyText1!.copyWith(
        color: AppColors.white,
      )),
      fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50.h)),
      elevation: MaterialStateProperty.all<double>(10.0),
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
      ),
    ),
  );

  static ThemeData light() {
    return ThemeData(
      textTheme: _lightTextTheme,
      textButtonTheme: _textButtonThemeData,
    );
  }
}
