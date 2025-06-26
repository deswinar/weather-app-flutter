import 'package:flutter/material.dart';
import 'package:weather_app_deswin/models/city_weather.dart';
import 'package:weather_app_deswin/data/dummy_weather_data.dart';
import 'package:weather_app_deswin/models/forecast.dart';
import 'package:weather_app_deswin/routes/app_routes.dart';
import 'package:weather_app_deswin/screens/details/weather_details_args.dart';
import 'package:weather_app_deswin/widgets/city_picker_modal.dart';
import 'package:weather_app_deswin/widgets/forecast_card.dart';
import 'package:weather_app_deswin/widgets/section_title_text.dart';
import 'package:weather_app_deswin/widgets/today_weather_section.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
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

  void _showCityPicker() async {
    final selected = await showCityPicker(
      context: context,
      cityWeatherMap: _cityWeatherMap,
    );

    if (selected != null) _onCityChanged(selected);
  }

  void _navigateToDetails(Forecast forecast) {
    Navigator.pushNamed(
      context,
      AppRoutes.weatherDetail, 
      arguments: WeatherDetailsArgs(
        city: _currentWeather.city,
        country: _currentWeather.country,
        forecast: forecast,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settingsScreen),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Today Section with City Picker
              TodayWeatherSection(
                currentWeather: _currentWeather,
                onCityTap: _showCityPicker,
                onDetailsTap: () => _navigateToDetails(_currentWeather.today),
              ),
              const SizedBox(height: 32),
        
              // Upcoming Forecast
              SectionTitleText('Upcoming Forecast'),
              const SizedBox(height: 12),
        
              LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = constraints.maxWidth > 600;
                  final forecasts = _currentWeather.forecasts.skip(1).toList(); // skip today
        
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
                      itemCount: forecasts.length,
                      itemBuilder: (context, index) {
                        final forecast = forecasts[index];
                        return ForecastCard(
                          forecast: forecast, 
                          onTap: () => _navigateToDetails(forecast),
                        );
                      },
                    );
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: forecasts.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final forecast = forecasts[index];
                        return ForecastCard(
                          forecast: forecast,
                          onTap: () => _navigateToDetails(forecast),
                        );
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
