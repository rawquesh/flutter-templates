import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const MediCarePlusApp());
}

class MediCarePlusApp extends StatelessWidget {
  const MediCarePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Rebuild MaterialApp whenever the theme changes so that
    // Theme.of(context).brightness always matches the manual `isDark`
    // styling used across the screens.
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (context, _) {
        final isDark = ThemeController.instance.isDark;
        return MaterialApp(
          title: 'MediCare+',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const LoginScreen(),
        );
      },
    );
  }
}
