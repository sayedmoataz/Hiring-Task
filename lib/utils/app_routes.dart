import 'package:flutter/material.dart';



import '../features/form_screen/presentation/pages/form_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String initialRoute = '/';
}

class AppRoutes {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.homePage:
      //   return MaterialPageRoute(
      //       builder: ((context) => BlocProvider(
      //             create: (context) => di.sl<HomePageCubit>()
      //               ..initSpeak()
      //               ..initSpeech(),
      //             child: const HomePage(),
      //           )));
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const FormScreen()));
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