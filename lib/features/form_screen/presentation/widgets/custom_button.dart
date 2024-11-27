import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  Function()? onTap;
  String buttonString;
  bool hasImage;
  CustomButton(
      {required this.onTap,
      required this.buttonString,
      required this.hasImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        hoverColor: AppColors.transparentColor,
        focusColor: AppColors.transparentColor,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.secondaryColor,
                AppColors.lightBlueColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(500.r),
          ),
          child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: hasImage
                  ? Row(
                      children: [
                        SizedBox(width: 16.w),
                        Text(
                          buttonString,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        Image.asset(
                          AppAssets.nextIcon,
                          width: 36.w,
                          height: 36.h,
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        buttonString,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )),
        ),
      ),
    );
  }
}
