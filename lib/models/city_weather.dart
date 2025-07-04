import 'package:weather_app_deswin/models/forecast.dart';

class CityWeather {
  final String city;
  final String country;
  final List<Forecast> forecasts;

  CityWeather({
    required this.city,
    required this.country,
    required this.forecasts,
  });

  Forecast get today => forecasts.first;
}
