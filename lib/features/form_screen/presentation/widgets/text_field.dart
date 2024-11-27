import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';

class CustomTextField extends StatelessWidget {
  final String imageName;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isRequired;
  final String labelText;
  final String hintText;
  final double? maxLength;
  final bool isError;

  const CustomTextField({
    Key? key,
    required this.imageName,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    this.maxLength,
    required this.labelText,
    required this.hintText,
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLength ?? 62.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: isError
                ? AppColors.redColor.withOpacity(0.5)
                : AppColors.lightBlueColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Row(
        crossAxisAlignment: maxLength != null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Image.asset(
              imageName,
              width: 24.w,
              height: 24.h,
              color: isError ? AppColors.redColor : AppColors.lightBlueColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: labelText,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.primaryColor,
                            ),
                      ),
                      if (isRequired) ...{
                        TextSpan(
                          text: AppStrings.asterisk,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.lightBlueColor),
                        ),
                      }
                    ],
                  ),
                ),
                TextFormField(
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  controller: controller,
                  keyboardType: keyboardType,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
