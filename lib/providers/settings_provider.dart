import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  static const _keyTemperatureUnit = 'temperatureUnit';
  static const _keyThemeMode = 'themeMode';

  String _temperatureUnit = 'C'; // Default is Celsius
  ThemeMode _themeMode = ThemeMode.system;

  String get temperatureUnit => _temperatureUnit;
  ThemeMode get themeMode => _themeMode;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _temperatureUnit = prefs.getString(_keyTemperatureUnit) ?? 'C';

    final themeIndex = prefs.getInt(_keyThemeMode);
    _themeMode = ThemeMode.values[themeIndex ?? ThemeMode.system.index];

    notifyListeners();
  }

  Future<void> setTemperatureUnit(String unit) async {
    _temperatureUnit = unit;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTemperatureUnit, unit);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyThemeMode, mode.index);
  }

  String formatTemperature(int celsiusTemp) {
    if (_temperatureUnit == 'F') {
      final fahrenheit = (celsiusTemp * 9 / 5) + 32;
      return '${fahrenheit.toStringAsFixed(0)}°F';
    } else {
      return '${celsiusTemp.toStringAsFixed(0)}°C';
    }
  }
}
