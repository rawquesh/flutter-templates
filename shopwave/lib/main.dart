import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/login/login_screen.dart';
import 'screens/home/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const ShopWaveApp());
}

class ShopWaveApp extends StatefulWidget {
  const ShopWaveApp({super.key});

  @override
  State<ShopWaveApp> createState() => _ShopWaveAppState();
}

class _ShopWaveAppState extends State<ShopWaveApp> {
  bool _isLoggedIn = false;
  int _currentThemeIndex = 1;

  void _onLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _onThemeChanged(int index) {
    setState(() {
      _currentThemeIndex = index;
    });
  }

  ThemeData _getTheme() {
    switch (_currentThemeIndex) {
      case 0:
        return AppTheme.lightTheme();
      case 1:
        return AppTheme.darkSidebarLightTheme();
      case 2:
        return AppTheme.darkTheme();
      default:
        return AppTheme.darkSidebarLightTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopWave',
      debugShowCheckedModeBanner: false,
      theme: _getTheme(),
      home: _isLoggedIn
          ? MainScreen(
              onThemeChanged: _onThemeChanged,
              currentThemeIndex: _currentThemeIndex,
            )
          : LoginScreen(onLogin: _onLogin),
    );
  }
}
