import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';

class RequiredWidget extends StatelessWidget {
  const RequiredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Text(
        AppStrings.required,
        style: TextStyle(
          color: AppColors.redColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
