import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_bottom_nav.dart';
import 'home_screen.dart';
import '../categories/categories_screen.dart';
import '../cart/cart_screen.dart';
import '../wishlist/wishlist_screen.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final ValueChanged<int> onThemeChanged;
  final int currentThemeIndex;

  const MainScreen({
    super.key,
    required this.onThemeChanged,
    required this.currentThemeIndex,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final int _cartCount = 3;

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomeScreen(
        onThemeChanged: () {},
        currentThemeIndex: widget.currentThemeIndex,
        onThemeChangedWithIndex: widget.onThemeChanged,
      ),
      const CategoriesScreen(),
      CartScreen(cartCount: _cartCount),
      const WishlistScreen(),
      const ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          GlassBottomNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
          ),
          GlassBottomNavItem(
            icon: Icons.grid_view_outlined,
            activeIcon: Icons.grid_view,
            label: 'Categories',
          ),
          GlassBottomNavItem(
            icon: Icons.shopping_bag_outlined,
            activeIcon: Icons.shopping_bag,
            label: 'Cart',
            badgeCount: _cartCount,
          ),
          GlassBottomNavItem(
            icon: Icons.favorite_border,
            activeIcon: Icons.favorite,
            label: 'Wishlist',
          ),
          GlassBottomNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  final int currentThemeIndex;
  final ValueChanged<int> onThemeChanged;

  const ThemeToggleButton({
    super.key,
    required this.currentThemeIndex,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: onThemeChanged,
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => [
        _buildThemeItem(0, 'Light Theme', Icons.wb_sunny, currentThemeIndex),
        _buildThemeItem(1, 'Dark Sidebar', Icons.nights_stay, currentThemeIndex),
        _buildThemeItem(2, 'Dark Theme', Icons.dark_mode, currentThemeIndex),
      ],
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          _getThemeIcon(currentThemeIndex),
          size: 20,
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildThemeItem(int index, String label, IconData icon, int current) {
    final isSelected = index == current;
    return PopupMenuItem<int>(
      value: index,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: isSelected ? AppColors.primaryBlue : null,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryBlue : null,
              fontWeight: isSelected ? FontWeight.w600 : null,
            ),
          ),
          if (isSelected) ...[
            const Spacer(),
            Icon(Icons.check, size: 18, color: AppColors.primaryBlue),
          ],
        ],
      ),
    );
  }

  IconData _getThemeIcon(int index) {
    switch (index) {
      case 0:
        return Icons.wb_sunny;
      case 1:
        return Icons.nights_stay;
      case 2:
        return Icons.dark_mode;
      default:
        return Icons.nights_stay;
    }
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: Container(
        color: isDark ? AppColors.sidebarDark : AppColors.sidebarLight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.gradientPrimary,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'ShopWave',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _drawerItem(Icons.grid_view, 'All Categories', context),
                    _drawerItem(Icons.shopping_bag_outlined, 'My Orders', context),
                    _drawerItem(Icons.local_shipping_outlined, 'Order Tracking', context),
                    _drawerItem(Icons.bolt, 'Flash Deals', context),
                    _drawerItem(Icons.compare_arrows, 'Compare Products', context),
                    _drawerItem(Icons.card_giftcard, 'Gift Cards', context),
                    _drawerItem(Icons.storefront_outlined, 'Become a Seller', context),
                    _drawerItem(Icons.local_offer_outlined, 'Offers & Deals', context),
                    const Divider(),
                    _drawerItem(Icons.settings_outlined, 'Settings', context),
                    _drawerItem(Icons.help_outline, 'Help & Support', context),
                    _drawerItem(Icons.info_outline, 'About', context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }
}
