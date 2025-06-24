import 'package:weather_app_deswin/models/city_weather.dart';

CityWeather getJakartaWeatherData() => _generateWeather(
  city: 'Jakarta',
  country: 'Indonesia',
  temps: [31, 30, 29, 32, 33, 31, 30, 29, 32, 33],
  conditions: ['sunny', 'sunny', 'cloudy', 'sunny', 'rainy', 'cloudy', 'sunny', 'rainy', 'thunderstorm', 'sunny'],
);

CityWeather getSurabayaWeatherData() => _generateWeather(
  city: 'Surabaya',
  country: 'Indonesia',
  temps: [34, 33, 32, 35, 36, 34, 33, 32, 35, 36],
  conditions: ['sunny', 'sunny', 'sunny', 'sunny', 'cloudy', 'sunny', 'sunny', 'cloudy', 'rainy', 'sunny'],
);

CityWeather getBandungWeatherData() => _generateWeather(
  city: 'Bandung',
  country: 'Indonesia',
  temps: [24, 25, 23, 26, 27, 25, 24, 23, 26, 27],
  conditions: ['cloudy', 'rainy', 'cloudy', 'sunny', 'rainy', 'thunderstorm', 'cloudy', 'rainy', 'sunny', 'cloudy'],
);

CityWeather getTokyoWeatherData() => _generateWeather(
  city: 'Tokyo',
  country: 'Japan',
  temps: [-2, 0, 1, -1, -3, 2, 0, -2, 1, -1],
  conditions: ['snowy', 'snowy', 'cloudy', 'snowy', 'snowy', 'sunny', 'snowy', 'snowy', 'cloudy', 'snowy'],
);

CityWeather _generateWeather({
  required String city,
  required String country,
  required List<int> temps,
  required List<String> conditions,
}) {
  final now = DateTime.now();

  return CityWeather(
    city: city,
    country: country,
    forecasts: List.generate(temps.length, (index) {
      final date = now.add(Duration(days: index));
      return Forecast(
        date: date,
        temperature: temps[index],
        condition: conditions[index],
      );
    }),
  );
}
