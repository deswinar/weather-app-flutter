import 'package:flutter/material.dart';
import 'package:weather_app_deswin/models/hourly_forecast.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_deswin/utils/utils.dart';

class HourlyForecastSection extends StatelessWidget {
  final List<HourlyForecast> hourlyData;

  const HourlyForecastSection({super.key, required this.hourlyData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: hourlyData.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final hour = hourlyData[index];
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                width: isTablet ? 120 : 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(DateFormat.Hm().format(hour.time),
                        style: Theme.of(context).textTheme.bodyMedium),
                    Icon(getWeatherIcon(hour.condition),
                        size: isTablet ? 40 : 28,
                        color: Theme.of(context).colorScheme.primary),
                    Text('${hour.temperature}°',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
