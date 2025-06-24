import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_deswin/models/city_weather.dart';
import 'package:weather_app_deswin/utils/utils.dart';

class TodayWeatherSection extends StatelessWidget {
  final CityWeather currentWeather;
  final VoidCallback? onCityTap;
  final VoidCallback? onDetailsTap;

  const TodayWeatherSection({
    super.key,
    required this.currentWeather,
    this.onCityTap,
    this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    final today = currentWeather.today;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // City and Country - City Picker
        GestureDetector(
          onTap: onCityTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${currentWeather.city}, ${currentWeather.country}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(decoration: TextDecoration.underline),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
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
        const SizedBox(height: 16),
        InkWell(
          onTap: onDetailsTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('See Full Details', style: Theme.of(context).textTheme.bodyLarge),
                const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
