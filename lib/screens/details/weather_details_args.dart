import 'package:weather_app_deswin/models/forecast.dart';

class WeatherDetailsArgs {
  final Forecast forecast;
  final String city;
  final String country;

  WeatherDetailsArgs({
    required this.forecast,
    required this.city,
    required this.country,
  });
}
