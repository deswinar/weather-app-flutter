import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_deswin/providers/settings_provider.dart';


IconData getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.grain;
      case 'snowy':
        return Icons.ac_unit;
      case 'thunderstorm':
        return Icons.flash_on;
      default:
        return Icons.device_unknown;
    }
  }

String formatTemperatureWithContext(BuildContext context, int temp) {
  final settings = Provider.of<SettingsProvider>(context, listen: false);
  return settings.formatTemperature(temp);
}