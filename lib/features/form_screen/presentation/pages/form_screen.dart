import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -25.h,
            right: 0,
            left: 0,
            child: Container(
              height: 287.h,
              width: 430.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/ops-man.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 26.w,
            top: 87.5.h,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: AppColors.whiteColor, size: 24.sp),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 85.h,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New Visitor Pre-Access',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Villa 45, Palm Crescent Compound, Al Sufouh 2',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.h,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: 851.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:BorderRadius.only(topLeft: Radius.circular(80.r)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1DA1F2).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 24.w, left: 22.0),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.w, left: 20.0),
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
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.secondaryColor,
                                          ),
                                    ),
                                    TextSpan(
                                      text: AppStrings.requiredField,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: AppColors.primaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            imageName: 'user',
                            labelText: 'Name',
                            hintText: 'John Doe',
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            isRequired: true,
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            imageName: 'user',
                            labelText: 'Phone',
                            hintText: '+201xxxxxxxxx',
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            isRequired: true,
                          ),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            imageName: 'user',
                            labelText: 'Email',
                            hintText: 'John_don@example.com',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            isRequired: false,
                          ),
                          SizedBox(height: 10.h),
                          
                          




                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Proceed to next step
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1DA1F2),
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Next Step',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
