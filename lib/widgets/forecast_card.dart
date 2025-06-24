import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_deswin/models/forecast.dart';
import 'package:weather_app_deswin/utils/utils.dart';

class ForecastCard extends StatelessWidget {
  final Forecast forecast;
  final VoidCallback? onTap;

  const ForecastCard({super.key, required this.forecast, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final icon = Icon(
      getWeatherIcon(forecast.condition),
      size: isTablet ? 40 : 28,
      color: Theme.of(context).colorScheme.primary,
    );

    final dateText = Text(
      DateFormat('EEEE, MMMM d').format(forecast.date),
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: isTablet ? TextAlign.left : TextAlign.center,
    );

    final tempText = Text(
      '${forecast.temperature}°C',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
    );

    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1.5,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(isTablet ? 20 : 12),
          child: isTablet
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dateText,
                    const SizedBox(height: 8),
                    icon,
                    const SizedBox(height: 8),
                    tempText,
                  ],
                )
              : Row(
                  children: [
                    icon,
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          dateText,
                          const SizedBox(height: 6),
                          tempText,
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  ],
                ),
        ),
      ),
    );
  }
}
