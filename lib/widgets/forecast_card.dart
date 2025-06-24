import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_deswin/models/city_weather.dart';
import 'package:weather_app_deswin/utils/utils.dart';

class ForecastCard extends StatelessWidget {
  final Forecast forecast;

  const ForecastCard({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final _icon = Icon(
      getWeatherIcon(forecast.condition),
      size: isTablet ? 40 : 28,
      color: Theme.of(context).colorScheme.primary,
    );

    final _dateText = Text(
      DateFormat('EEEE, MMMM d').format(forecast.date),
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: isTablet ? TextAlign.left : TextAlign.center,
    );

    final _tempText = Text(
      '${forecast.temperature}°C',
      style: Theme.of(context).textTheme.bodyMedium,
    );

    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: isTablet
          ? Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _dateText,
                _icon,
                _tempText,
              ],
            )
          : Row(
              children: [
                _icon,
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _dateText,
                      const SizedBox(height: 6),
                      _tempText,
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
