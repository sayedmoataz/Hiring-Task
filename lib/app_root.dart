import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'utils/app_colors.dart';
import 'utils/app_routes.dart';
import 'utils/app_strings.dart';
import 'utils/app_theme.dart';

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            color: AppColors.primaryColor,
            initialRoute: '/',
            onGenerateRoute: AppRoutes.onGeneratedRoute,
          );
        });
  }
}