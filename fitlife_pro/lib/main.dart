import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'theme/app_theme.dart';
import 'screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(FitLifeProApp(savedThemeMode: savedThemeMode));
}

class FitLifeProApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const FitLifeProApp({
    super.key,
    this.savedThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) {
        return MaterialApp(
          title: 'FitLife Pro',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
          home: const LoginScreen(),
        );
      },
    );
  }
}
