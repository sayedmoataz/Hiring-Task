import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String imageName;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isRequired;
  final String labelText;
  final String hintText;

  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.imageName,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    required this.labelText,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.lightBlueColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Image.asset(
                  'assets/png/$imageName.png',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              Expanded(
                child: TextFormField(
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  onTapOutside: (event) =>FocusManager.instance.primaryFocus!.unfocus(),
                  controller: controller,
                  keyboardType: keyboardType,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
                  decoration: InputDecoration(
                    labelText: isRequired ? '$labelText*' : labelText,
                    labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
