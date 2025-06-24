import 'package:flutter/material.dart';
import 'package:weather_app_deswin/models/city_weather.dart';
import 'package:weather_app_deswin/data/dummy_weather_data.dart';
import 'package:weather_app_deswin/widgets/forecast_card.dart';
import 'package:weather_app_deswin/widgets/today_weather_section.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final Map<String, CityWeather> _cityWeatherMap = {
    'Jakarta': getJakartaWeatherData(),
    'Surabaya': getSurabayaWeatherData(),
    'Bandung': getBandungWeatherData(),
    'Tokyo': getTokyoWeatherData(),
  };

  late String _selectedCity;
  late CityWeather _currentWeather;

  @override
  void initState() {
    super.initState();
    _selectedCity = 'Jakarta';
    _currentWeather = _cityWeatherMap[_selectedCity]!;
  }

  void _onCityChanged(String? city) {
    if (city == null) return;

    setState(() {
      _selectedCity = city;
      _currentWeather = _cityWeatherMap[city]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: _selectedCity,
              underline: const SizedBox(),
              dropdownColor: Theme.of(context).colorScheme.surface,
              style: Theme.of(context).textTheme.bodyMedium,
              items: _cityWeatherMap.keys.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: _onCityChanged,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today
              TodayWeatherSection(currentWeather: _currentWeather),
              const SizedBox(height: 32),
        
              Text(
                'Upcoming Forecast',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
        
              // Forecast List/Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = constraints.maxWidth > 600;
                      
                  if (isTablet) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 3 / 1.5,
                      ),
                      itemCount: _currentWeather.forecasts.length - 1,
                      itemBuilder: (context, index) {
                        final forecast = _currentWeather.forecasts[index + 1];
                        return ForecastCard(forecast: forecast);
                      },
                    );
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _currentWeather.forecasts.length - 1,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final forecast = _currentWeather.forecasts[index + 1];
                        return ForecastCard(forecast: forecast);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
