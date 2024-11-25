import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'features/form_screen/presentation/pages/form_screen.dart';
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
            home: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                List<ConnectivityResult> connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  return const FormScreen();
                } else {
                  return const SizedBox.shrink();
                }
              },
              child: Center(
                  child: CircularProgressIndicator(color: AppColors.secondaryColor)),
            ),
          );
        });
  }
}