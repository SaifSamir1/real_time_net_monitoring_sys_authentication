import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String arabicFontFamily = 'Amiri';

class AppStyles {
  static TextStyle styleRegular(double size, BuildContext context,
      {Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle styleSemiBold(double size, BuildContext context,
      {Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle styleBold(double size, BuildContext context,
      {Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}

double getFontSize({required double baseSize}) {
  return ScreenUtil().screenWidth < 400
      ? (baseSize )
      : ScreenUtil().screenWidth < 600
          ? (baseSize + 6)
          : ScreenUtil().screenWidth < 1024
              ? (baseSize + 4)
              : ScreenUtil().screenWidth < 1170
                  ? (baseSize + 10)
                  : ScreenUtil().screenWidth < 1400
                      ? (baseSize + 8)
                      : ScreenUtil().screenWidth > 2560
                          ? (baseSize + 6)
                          : baseSize;
}
