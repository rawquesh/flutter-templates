import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  AppThemeMode _currentTheme = AppThemeMode.darkSidebar;

  AppThemeMode get currentTheme => _currentTheme;

  ThemeProvider() {
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final savedTheme = await AdaptiveTheme.getThemeMode();
    if (savedTheme != null) {
      _currentTheme = _themeModeFromAdaptive(savedTheme);
      notifyListeners();
    }
  }

  void setTheme(BuildContext context, AppThemeMode mode) {
    _currentTheme = mode;
    final themeMode = _themeModeToAdaptive(mode);
    AdaptiveTheme.of(context).setThemeMode(themeMode);
    notifyListeners();
  }

  void toggleTheme(BuildContext context) {
    switch (_currentTheme) {
      case AppThemeMode.light:
        setTheme(context, AppThemeMode.darkSidebar);
        break;
      case AppThemeMode.darkSidebar:
        setTheme(context, AppThemeMode.dark);
        break;
      case AppThemeMode.dark:
        setTheme(context, AppThemeMode.light);
        break;
    }
  }

  AdaptiveThemeMode _themeModeToAdaptive(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return AdaptiveThemeMode.light;
      case AppThemeMode.darkSidebar:
      case AppThemeMode.dark:
        return AdaptiveThemeMode.dark;
    }
  }

  AppThemeMode _themeModeFromAdaptive(AdaptiveThemeMode mode) {
    switch (mode) {
      case AdaptiveThemeMode.light:
        return AppThemeMode.light;
      case AdaptiveThemeMode.dark:
        return AppThemeMode.darkSidebar;
      case AdaptiveThemeMode.system:
        return AppThemeMode.darkSidebar;
    }
  }

  bool get isDarkMode {
    return _currentTheme == AppThemeMode.dark || _currentTheme == AppThemeMode.darkSidebar;
  }

  bool get isDarkSidebarMode => _currentTheme == AppThemeMode.darkSidebar;

  Color get sidebarColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return const Color(0xFFFFFFFF);
      case AppThemeMode.darkSidebar:
        return const Color(0xFF141420);
      case AppThemeMode.dark:
        return const Color(0xFF141420);
    }
  }

  Color get backgroundColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return const Color(0xFFF5F5F7);
      case AppThemeMode.darkSidebar:
        return const Color(0xFFFAFAFA);
      case AppThemeMode.dark:
        return const Color(0xFF0D0D1A);
    }
  }

  Color get cardColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return const Color(0xFFFFFFFF);
      case AppThemeMode.darkSidebar:
        return const Color(0xFFFFFFFF);
      case AppThemeMode.dark:
        return const Color(0xFF1A1A2E);
    }
  }

  Color get glassBackgroundColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return Colors.white.withValues(alpha: 0.7);
      case AppThemeMode.darkSidebar:
        return Colors.white.withValues(alpha: 0.7);
      case AppThemeMode.dark:
        return const Color(0xFF1A1A2E).withValues(alpha: 0.7);
    }
  }

  Color get glassBorderColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return Colors.white.withValues(alpha: 0.5);
      case AppThemeMode.darkSidebar:
        return Colors.white.withValues(alpha: 0.5);
      case AppThemeMode.dark:
        return Colors.white.withValues(alpha: 0.1);
    }
  }

  Color get textPrimaryColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return const Color(0xFF1A1A2E);
      case AppThemeMode.darkSidebar:
        return const Color(0xFF1A1A2E);
      case AppThemeMode.dark:
        return const Color(0xFFFFFFFF);
    }
  }

  Color get textSecondaryColor {
    switch (_currentTheme) {
      case AppThemeMode.light:
        return const Color(0xFF666666);
      case AppThemeMode.darkSidebar:
        return const Color(0xFF666666);
      case AppThemeMode.dark:
        return const Color(0xFF888888);
    }
  }
}
