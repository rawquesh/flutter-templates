import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'app_theme.dart';

class ThemeProvider extends StatelessWidget {
  final Widget child;
  final AppThemeMode initialTheme;

  const ThemeProvider({
    super.key,
    required this.child,
    this.initialTheme = AppThemeMode.darkSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: initialTheme == AppThemeMode.light
          ? AdaptiveThemeMode.light
          : AdaptiveThemeMode.dark,
      builder: (ThemeData light, ThemeData dark) {
        return MaterialApp(
          title: 'MediCare+',
          theme: light,
          darkTheme: dark,
          themeMode: ThemeMode.system,
          home: child,
        );
      },
      debugShowFloatingThemeButton: false,
    );
  }
}

class ThemeService {
  static void setTheme(BuildContext context, AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        AdaptiveTheme.of(context).setLight();
        break;
      case AppThemeMode.darkSidebar:
      case AppThemeMode.dark:
        AdaptiveTheme.of(context).setDark();
        break;
    }
  }

  static AppThemeMode getCurrentTheme(BuildContext context) {
    final mode = AdaptiveTheme.of(context).mode;
    if (mode == AdaptiveThemeMode.light) {
      return AppThemeMode.light;
    }
    return AppThemeMode.dark;
  }

  static bool isDarkMode(BuildContext context) {
    return AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
  }

  static void toggleTheme(BuildContext context) {
    final currentMode = AdaptiveTheme.of(context).mode;
    if (currentMode == AdaptiveThemeMode.light) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }
}
