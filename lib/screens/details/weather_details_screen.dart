import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_deswin/models/forecast.dart';
import 'package:weather_app_deswin/utils/utils.dart';
import 'package:weather_app_deswin/widgets/hourly_forecast_section.dart';
import 'package:weather_app_deswin/widgets/section_title_text.dart';
import 'package:weather_app_deswin/widgets/weather_detail_row.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final String city;
  final String country;
  final Forecast forecast;

  const WeatherDetailsScreen({
    super.key,
    required this.city,
    required this.country,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;
    final iconSize = isTablet ? 80.0 : 60.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather Details')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // City & Country
              Text(
                '$city, $country',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat('EEEE, d MMMM yyyy').format(forecast.date),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
        
              // Weather Icon + Temp + Condition
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    getWeatherIcon(forecast.condition),
                    size: iconSize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatTemperatureWithContext(context, forecast.temperature),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        forecast.condition,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  )
                ],
              ),
        
              const SizedBox(height: 24),
        
              // Additional Weather Details
              WeatherDetailRow(label: 'Humidity', value: '${forecast.humidity}%'),
              WeatherDetailRow(label: 'Pressure', value: '${forecast.pressure} hPa'),
              WeatherDetailRow(label: 'Wind', value: '${forecast.windSpeed} km/h ${forecast.windDirection}'),
              WeatherDetailRow(label: 'UV Index', value: forecast.uvIndex.toStringAsFixed(1)),
        
              const SizedBox(height: 28),
        
              // Hourly Forecast
              SectionTitleText('Hourly Forecast'),
              const SizedBox(height: 12),
              HourlyForecastSection(hourlyData: forecast.hourly),
            ],
          ),
        ),
      ),
    );
  }
}
