import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../widgets/date_time_picker.dart';
import '../widgets/required_widget.dart';
import '../widgets/text_field.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController visitDateController = TextEditingController();
  final TextEditingController visitTimeController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController visitReasonController = TextEditingController();
  final Map<String, bool> _errorStates = {
    'name': false,
    'phone': false,
    'email': false,
    'visitReason': false,
    'visitTime': false,
    'visitDate': false
  };

  bool _validateField(String key, TextEditingController controller) {
    if (controller.text.isEmpty) {
      _errorStates[key] = true;
      return false;
    }
    _errorStates[key] = false;
    return true;
  }

  // Validate all fields
  bool _validateAllFields() {
    bool isValid = true;

    isValid &= _validateField('name', nameController);
    isValid &= _validateField('phone', phoneController);
    isValid &= _validateField('visitReason', visitReasonController);

    // Validate date picker
    if (visitDateController.text.isEmpty) {
      _errorStates['visitDate'] = true;
      isValid = false;
    } else {
      _errorStates['visitDate'] = false;
    }
    if (visitTimeController.text.isEmpty) {
      _errorStates['visitTime'] = true;
      isValid = false;
    } else {
      _errorStates['visitTime'] = false;
    }

    setState(() {}); // Update UI to reflect error states
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          // Non-scrollable Stack (Header)
          SizedBox(
            height: 200.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  top: -25.h,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 287.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.opsMan),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 85.h,
                  right: 0,
                  left: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Icon(Icons.arrow_back,
                          color: AppColors.whiteColor, size: 24.sp),
                      SizedBox(width: 30.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.newVisitor,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            AppStrings.address,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Form Container (Scrollable)
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80.r)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Text(
                              AppStrings.visitorInfo,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                            const Spacer(),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.asterisk,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColors.secondaryColor,
                                        ),
                                  ),
                                  TextSpan(
                                    text: AppStrings.requiredField,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        CustomTextField(
                          imageName: AppAssets.userIcon,
                          labelText: AppStrings.Name,
                          hintText: AppStrings.NameHint,
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          isRequired: true,
                          isError: _errorStates['name'] ?? false,
                        ),
                        if (_errorStates['name'] ?? false)
                          const RequiredWidget(),
                        SizedBox(height: 12.h),
                        CustomTextField(
                          imageName: AppAssets.phoneIcon,
                          labelText: AppStrings.Phone,
                          hintText: AppStrings.PhoneHint,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          isRequired: true,
                          isError: _errorStates['phone'] ?? false,
                        ),
                        if (_errorStates['phone'] ?? false)
                          const RequiredWidget(),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          imageName: AppAssets.emailIcon,
                          labelText: AppStrings.Email,
                          hintText: AppStrings.EmailHint,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          isRequired: false,
                          isError: false,
                        ),
                        SizedBox(height: 12.h),
                        CustomDateTimePicker(
                          isDatePicker: true,
                          onDateTimeSelected: (dateTime) =>
                              visitDateController.text = dateTime.toString(),
                          imageName: AppAssets.calenderIcon,
                          labelText: AppStrings.date,
                          hintText: AppStrings.dateHint,
                          isRequired: true,
                          isError: _errorStates['visitDate'] ?? false,
                        ),
                        if (_errorStates['visitDate'] ?? false)
                          const RequiredWidget(),
                        SizedBox(height: 12.h),
                        CustomDateTimePicker(
                          imageName: AppAssets.clockIcon,
                          labelText: AppStrings.time,
                          isDatePicker: false,
                          onDateTimeSelected: (time) =>
                              visitTimeController.text = time.toString(),
                          hintText: AppStrings.timeHint,
                          isRequired: true,
                          isError: _errorStates['visitTime'] ?? false,
                        ),
                        if (_errorStates['visitTime'] ?? false)
                          const RequiredWidget(),
                        SizedBox(height: 12.h),
                        CustomTextField(
                          imageName: AppAssets.idIcon,
                          labelText: AppStrings.idNumber,
                          hintText: AppStrings.idNumberHint,
                          controller: idNumberController,
                          keyboardType: TextInputType.number,
                          isRequired: false,
                        ),
                        SizedBox(height: 12.h),
                        CustomTextField(
                          imageName: AppAssets.messageIcon,
                          labelText: AppStrings.visitReason,
                          hintText: '',
                          controller: visitReasonController,
                          keyboardType: TextInputType.text,
                          isRequired: true,
                          maxLength: 126.h,
                          isError: _errorStates['visitReason'] ?? false,
                        ),
                        if (_errorStates['visitReason'] ?? false)
                          const RequiredWidget(),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              // if (_validateAllFields()) {
                              Navigator.of(context).pushNamed(
                                Routes.qrCodeScreen,
                              );
                              // }
                            },
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
                                child: Row(
                                  children: [
                                    SizedBox(width: 16.w),
                                    Text(
                                      AppStrings.nextStep,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      AppAssets.nextIcon,
                                      width: 36.w,
                                      height: 36.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
