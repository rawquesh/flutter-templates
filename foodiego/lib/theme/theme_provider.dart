import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

enum AppThemeMode {
  light,
  hybrid,
  dark,
}

class ThemeProvider extends ChangeNotifier {
  AppThemeMode _currentTheme = AppThemeMode.hybrid;

  AppThemeMode get currentTheme => _currentTheme;

  AdaptiveThemeMode get adaptiveThemeMode {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return AdaptiveThemeMode.light;
      case AppThemeMode.hybrid:
      case AppThemeMode.dark:
        return AdaptiveThemeMode.dark;
    }
  }

  void setTheme(AppThemeMode theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    switch (_currentTheme) {
      case AppThemeMode.light:
        _currentTheme = AppThemeMode.hybrid;
        break;
      case AppThemeMode.hybrid:
        _currentTheme = AppThemeMode.dark;
        break;
      case AppThemeMode.dark:
        _currentTheme = AppThemeMode.light;
        break;
    }
    notifyListeners();
  }

  String get themeLabel {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.hybrid:
        return 'Hybrid';
      case AppThemeMode.dark:
        return 'Dark';
    }
  }

  IconData get themeIcon {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return Icons.wb_sunny;
      case AppThemeMode.hybrid:
        return Icons.brightness_2;
      case AppThemeMode.dark:
        return Icons.nightlight_round;
    }
  }
}
