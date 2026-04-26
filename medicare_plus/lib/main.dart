import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const MediCarePlusApp());
}

class MediCarePlusApp extends StatelessWidget {
  const MediCarePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediCare+',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const LoginScreen(),
    );
  }
}
