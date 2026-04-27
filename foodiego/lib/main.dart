import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'utils/constants.dart';
import 'screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/restaurant/restaurant_detail_screen.dart';
import 'screens/restaurant/food_detail_screen.dart';
import 'screens/restaurant/restaurant_reviews_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/cart/checkout_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/orders/order_tracking_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/search/advanced_filters_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/booking/table_booking_screen.dart';
import 'widgets/glass_bottom_nav.dart';

void main() {
  runApp(const FoodieGoApp());
}

class FoodieGoApp extends StatefulWidget {
  const FoodieGoApp({super.key});

  @override
  State<FoodieGoApp> createState() => _FoodieGoAppState();
}

class _FoodieGoAppState extends State<FoodieGoApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodieGo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: MainWrapper(
        themeMode: _themeMode,
        onThemeChanged: _setThemeMode,
      ),
    );
  }
}

class MainWrapper extends StatefulWidget {
  final ThemeMode themeMode;
  final Function(ThemeMode) onThemeChanged;

  const MainWrapper({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  bool _isLoggedIn = false;
  int _currentNavIndex = 0;

  void _onLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoggedIn) {
      return LoginScreen(onLogin: _onLogin);
    }

    return MainShell(
      currentIndex: _currentNavIndex,
      onNavTap: (index) => setState(() => _currentNavIndex = index),
      themeMode: widget.themeMode,
      onThemeChanged: widget.onThemeChanged,
    );
  }
}

class MainShell extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onNavTap;
  final ThemeMode themeMode;
  final Function(ThemeMode) onThemeChanged;

  const MainShell({
    super.key,
    required this.currentIndex,
    required this.onNavTap,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: [
              HomeScreen(
                onRestaurantTap: () => _navigateTo(context, 'restaurant'),
              ),
              const SearchScreen(),
              const OrdersScreen(),
              CartScreen(
                onCheckout: () => _navigateTo(context, 'checkout'),
              ),
              ProfileScreen(
                onSettingsTap: () => _navigateTo(context, 'settings'),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GlassBottomNav(
              currentIndex: currentIndex,
              onTap: onNavTap,
              cartCount: 2,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String route) {
    switch (route) {
      case 'restaurant':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantDetailScreen(
              restaurant: AppConstants.restaurants[0],
              onFoodTap: () => _navigateTo(context, 'food'),
            ),
          ),
        );
        break;
      case 'food':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FoodDetailScreen(
              item: AppConstants.pizzaPalaceMenu[0],
            ),
          ),
        );
        break;
      case 'checkout':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CheckoutScreen(),
          ),
        );
        break;
      case 'settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SettingsScreen(
              onThemeChanged: (index) {
                onThemeChanged(index == 0 ? ThemeMode.light : ThemeMode.dark);
              },
            ),
          ),
        );
        break;
      case 'orders':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OrdersScreen(),
          ),
        );
        break;
      case 'tracking':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OrderTrackingScreen(),
          ),
        );
        break;
      case 'search':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SearchScreen(),
          ),
        );
        break;
      case 'filters':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AdvancedFiltersScreen(),
          ),
        );
        break;
      case 'reviews':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RestaurantReviewsScreen(),
          ),
        );
        break;
      case 'booking':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TableBookingScreen(),
          ),
        );
        break;
    }
  }
}
