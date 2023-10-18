import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_ui_app/core/app_routes.dart';

import 'core/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375.0, 812.0),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            title: 'PlantUI',
            theme: appTheme(),
            initialRoute: AppRoutes.onBoarding,
            onGenerateRoute: AppRoutes.generateRoute,
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ),
              );
            },
          );
        });
  }

  ThemeData appTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: kScaffoldColor,
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 12, height: 1.83),
        bodyLarge:
            TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.375),
        bodyMedium: TextStyle(fontSize: 14, height: 1.5714),
        labelLarge:
            TextStyle(fontSize: 16, height: 2, fontWeight: FontWeight.w600),
      ),
    );
  }
}
