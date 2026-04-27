import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const FitLifeProApp());
}

class FitLifeProApp extends StatefulWidget {
  const FitLifeProApp({super.key});

  @override
  State<FitLifeProApp> createState() => _FitLifeProAppState();
}

class _FitLifeProAppState extends State<FitLifeProApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  bool _isLoggedIn = false;

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  void _onLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitLife Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: _isLoggedIn
          ? HomeScreen(onThemeChanged: _setThemeMode)
          : LoginScreen(onThemeChanged: _setThemeMode, onLogin: _onLogin),
    );
  }
}
