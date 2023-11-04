
import 'package:flutter/material.dart';
import 'package:plant_ui_app/presentation/home/home_page.dart';
import '../presentation/onboarding/onboarding_screen.dart';

class AppRoutes {
  static const String onBoarding = "/";
  static const String home = "/home";
  static const String details = "/details";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OnbardingScreen());

      case AppRoutes.home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());

      // case AppRoutes.details:
      //   final item = settings.arguments as PlantModel;
      //   final animation = settings.arguments as Animation;
      //   return MaterialPageRoute(
      //       settings: settings,
      //       builder: (_) => PlantDetailsInfo(
      //             plantModel: item,
      //             animation: animation,
      //           ));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
