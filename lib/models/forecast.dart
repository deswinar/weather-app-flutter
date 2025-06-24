import 'package:weather_app_deswin/models/hourly_forecast.dart';

class Forecast {
  final int temperature;
  final String condition;
  final DateTime date;
  final List<HourlyForecast> hourly;

  // Details
  final int humidity;
  final int pressure;
  final double windSpeed;
  final String windDirection;
  final double uvIndex;

  Forecast({
    required this.temperature,
    required this.condition,
    required this.date,
    required this.hourly,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.uvIndex,
  });
}