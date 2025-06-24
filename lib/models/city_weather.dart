class Forecast {
  final int temperature;
  final String condition;
  final DateTime date;

  Forecast({
    required this.temperature,
    required this.condition,
    required this.date,
  });
}

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
