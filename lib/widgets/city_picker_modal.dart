import 'package:flutter/material.dart';
import 'package:weather_app_deswin/models/city_weather.dart';
import 'package:weather_app_deswin/utils/utils.dart';

Future<String?> showCityPicker({
  required BuildContext context,
  required Map<String, CityWeather> cityWeatherMap,
}) {
  return showModalBottomSheet<String>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text('Choose a City', style: Theme.of(context).textTheme.titleMedium),
          const Divider(height: 24),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: cityWeatherMap.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final entry = cityWeatherMap.entries.elementAt(index);
                final city = entry.key;
                final weather = entry.value;

                return ListTile(
                  onTap: () => Navigator.pop(context, city),
                  leading: Icon(
                    getWeatherIcon(weather.today.condition),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text('$city, ${weather.country}'),
                  subtitle: Text('${formatTemperatureWithContext(context, weather.today.temperature)} • ${weather.today.condition}'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
