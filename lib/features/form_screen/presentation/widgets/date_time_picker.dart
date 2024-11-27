import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';

class CustomDateTimePicker extends StatefulWidget {
  final bool isDatePicker;
  final Function(DateTime) onDateTimeSelected;
  final String imageName;
  final String labelText;
  final String hintText;
  final bool isRequired;
  final bool isError;

  const CustomDateTimePicker({
    Key? key,
    required this.isDatePicker,
    required this.onDateTimeSelected,
    required this.imageName,
    required this.labelText,
    required this.hintText,
    this.isRequired = false,
    this.isError = false,
  }) : super(key: key);

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? _selectedDateTime;

  String getFormattedDateTime() {
    if (_selectedDateTime == null) return widget.hintText;
    return widget.isDatePicker
        ? DateFormat('yyyy-MM-dd').format(_selectedDateTime!)
        : DateFormat('HH:mm').format(_selectedDateTime!);
  }

  void _showPicker() {
    if (widget.isDatePicker) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2027),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.whiteColor,
                onSurface: AppColors.lightBlueColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                ),
              ),
            ),
            child: child!,
          );
        },
      ).then((pickedDate) {
        if (pickedDate != null) {
          setState(() {
            _selectedDateTime = pickedDate;
            widget.onDateTimeSelected(_selectedDateTime!);
          });
        }
      });
    } else {
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.primaryColor,
                onSurface: AppColors.secondaryColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                ),
              ),
            ),
            child: child!,
          );
        },
      ).then((pickedTime) {
        if (pickedTime != null) {
          setState(() {
            _selectedDateTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              pickedTime.hour,
              pickedTime.minute,
            );
            widget.onDateTimeSelected(_selectedDateTime!);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showPicker,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: widget.isError
                  ? AppColors.redColor.withOpacity(0.5)
                  : AppColors.lightBlueColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Image.asset(
                    widget.imageName,
                    width: 24.w,
                    height: 24.h,
                    color: widget.isError
                        ? AppColors.redColor
                        : AppColors.lightBlueColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 8.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.labelText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                            if (widget.isRequired) // Add asterisk for required
                              TextSpan(
                                text: AppStrings.asterisk,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.lightBlueColor,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      Text(
                        getFormattedDateTime(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // if (widget.isError) // Show error message if applicable
            //   Padding(
            //     padding: EdgeInsets.only(top: 8.h),
            //     child: Text(
            //       AppStrings.fieldRequiredError,
            //       style: TextStyle(
            //         color: AppAppColors.redColorColor,
            //         fontSize: 12.sp,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
