import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_deswin/models/city_weather.dart';
import 'package:weather_app_deswin/utils/utils.dart';

class TodayWeatherSection extends StatelessWidget {
  final CityWeather currentWeather;

  const TodayWeatherSection({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    final today = currentWeather.today;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // City and Country
        Text(
          '${currentWeather.city}, ${currentWeather.country}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('EEEE, MMMM d').format(today.date),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),

        // Icon, Temperature, Condition
        Center(
          child: Column(
            children: [
              Icon(
                getWeatherIcon(today.condition),
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                '${today.temperature}°C',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                today.condition[0].toUpperCase() + today.condition.substring(1),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
