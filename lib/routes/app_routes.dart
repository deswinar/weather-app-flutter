import 'package:flutter/material.dart';
import 'package:weather_app_deswin/screens/details/weather_details_args.dart';
import 'package:weather_app_deswin/screens/details/weather_details_screen.dart';
import 'package:weather_app_deswin/screens/home/weather_home_screen.dart';
import 'package:weather_app_deswin/screens/settings/settings_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String weatherDetail = '/weather-details';
  static const String settingsScreen = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const WeatherHomeScreen());

      case weatherDetail:
        final args = settings.arguments as WeatherDetailsArgs;
        return MaterialPageRoute(
          builder: (_) => WeatherDetailsScreen(city: args.city, country: args.country, forecast: args.forecast),
        );

      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
