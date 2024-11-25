import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData appTheme(){
  return ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'NeueHaasDisplay',
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'NeueHaasDisplay',
        fontSize: 18.sp,
        color: AppColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'NeueHaasDisplay',
        fontSize: 14.sp,
        color: AppColors.whiteColor,
      ),
    ),
  );
}