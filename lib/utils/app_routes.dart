import 'package:flutter/material.dart';



import '../features/form_screen/presentation/pages/form_screen.dart';
import '../features/qr_code_screen/presentation/pages/qr_code_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String qrCodeScreen = 'qrCodeScreen';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const FormScreen()));
      case Routes.qrCodeScreen:
        return MaterialPageRoute(builder: ((context) => const VisitorQRCodeScreen()));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
                body: Center(
              child: Text(AppStrings.noRoutesFound),
            ))));
  }
}