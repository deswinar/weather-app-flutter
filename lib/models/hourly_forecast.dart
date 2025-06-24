class HourlyForecast {
  final DateTime time;
  final int temperature;
  final String condition;

  // Details
  final int humidity;
  final double windSpeed;
  final String windDirection;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
  });
}