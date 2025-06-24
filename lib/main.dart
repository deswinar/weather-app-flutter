import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_deswin/screens/home/weather_home_screen.dart';
import 'package:weather_app_deswin/theme/app_theme.dart';
import 'package:weather_app_deswin/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: 'Weather App',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.home,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: WeatherHomeScreen(),
    );
  }
}