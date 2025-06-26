import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_deswin/providers/settings_provider.dart';
import 'package:weather_app_deswin/utils/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    final selectedUnit = settings.temperatureUnit;
    final selectedTheme = settings.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Temperature Unit', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          RadioListTile<String>(
            value: 'C',
            groupValue: selectedUnit,
            onChanged: (value) {
              if (value != null) {
                settings.setTemperatureUnit(value);
              }
            },
            title: const Text('Celsius (°C)'),
          ),
          RadioListTile<String>(
            value: 'F',
            groupValue: selectedUnit,
            onChanged: (value) {
              if (value != null) {
                settings.setTemperatureUnit(value);
              }
            },
            title: const Text('Fahrenheit (°F)'),
          ),

          const SizedBox(height: 24),
          const Text('App Theme', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          RadioListTile<ThemeMode>(
            value: ThemeMode.system,
            groupValue: selectedTheme,
            onChanged: (mode) {
              if (mode != null) {
                settings.setThemeMode(mode);
              }
            },
            title: const Text('System Default'),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.light,
            groupValue: selectedTheme,
            onChanged: (mode) {
              if (mode != null) {
                settings.setThemeMode(mode);
              }
            },
            title: const Text('Light Theme'),
          ),
          RadioListTile<ThemeMode>(
            value: ThemeMode.dark,
            groupValue: selectedTheme,
            onChanged: (mode) {
              if (mode != null) {
                settings.setThemeMode(mode);
              }
            },
            title: const Text('Dark Theme'),
          ),

          const SizedBox(height: 32),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Developer Info'),
            subtitle: const Text('Made with Flutter by ${AppConstants.developerName}'),
          ),
        ],
      ),
    );
  }
}
