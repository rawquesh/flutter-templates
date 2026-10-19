import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../screens/orders/orders_screen.dart';
import '../screens/order_tracking/order_tracking_screen.dart';
import '../screens/flash_deals/flash_deals_screen.dart';
import '../screens/compare/compare_products_screen.dart';
import '../screens/gift_cards/gift_cards_screen.dart';
import '../screens/vendor/vendor_dashboard_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  final ValueChanged<int>? onSelectTab;

  const AppDrawer({super.key, this.onSelectTab});

  void _go(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

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
                    _drawerItem(
                      Icons.grid_view,
                      'All Categories',
                      context,
                      onTap: () {
                        Navigator.pop(context);
                        onSelectTab?.call(1);
                      },
                    ),
                    _drawerItem(
                      Icons.shopping_bag_outlined,
                      'My Orders',
                      context,
                      onTap: () => _go(context, const OrdersScreen()),
                    ),
                    _drawerItem(
                      Icons.local_shipping_outlined,
                      'Order Tracking',
                      context,
                      onTap: () => _go(context, const OrderTrackingScreen()),
                    ),
                    _drawerItem(
                      Icons.bolt,
                      'Flash Deals',
                      context,
                      onTap: () => _go(context, const FlashDealsScreen()),
                    ),
                    _drawerItem(
                      Icons.compare_arrows,
                      'Compare Products',
                      context,
                      onTap: () => _go(context, const CompareProductsScreen()),
                    ),
                    _drawerItem(
                      Icons.card_giftcard,
                      'Gift Cards',
                      context,
                      onTap: () => _go(context, const GiftCardsScreen()),
                    ),
                    _drawerItem(
                      Icons.storefront_outlined,
                      'Become a Seller',
                      context,
                      onTap: () => _go(context, const VendorDashboardScreen()),
                    ),
                    _drawerItem(
                      Icons.local_offer_outlined,
                      'Offers & Deals',
                      context,
                      onTap: () => _go(context, const FlashDealsScreen()),
                    ),
                    const Divider(),
                    _drawerItem(
                      Icons.settings_outlined,
                      'Settings',
                      context,
                      onTap: () => _go(context, const SettingsScreen()),
                    ),
                    _drawerItem(
                      Icons.help_outline,
                      'Help & Support',
                      context,
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Help & Support'),
                            content: const Text(
                              'Need help with your order?\n\nEmail us at support@shopwave.app\nor call 1-800-SHOPWAVE.\n\nSupport hours: Mon–Sat, 9am–9pm.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    _drawerItem(
                      Icons.info_outline,
                      'About',
                      context,
                      onTap: () {
                        Navigator.pop(context);
                        showAboutDialog(
                          context: context,
                          applicationName: 'ShopWave',
                          applicationVersion: '1.0.0',
                          applicationLegalese: 'A Flutter e-commerce UI template.',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, BuildContext context,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
