import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 24),
            _buildStatsRow(context),
            const SizedBox(height: 24),
            _buildMembershipCard(context),
            const SizedBox(height: 24),
            _buildMenuList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.gradientPrimary,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.primaryBlue,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'john.doe@email.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      children: [
        _buildStatItem(context, 'Orders', '12', Icons.shopping_bag_outlined),
        const SizedBox(width: 12),
        _buildStatItem(context, 'Wishlist', '5', Icons.favorite_border),
        const SizedBox(width: 12),
        _buildStatItem(context, 'Reviews', '8', Icons.star_border),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryBlue),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.warning.withValues(alpha: 0.8),
                AppColors.warning,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.workspace_premium, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gold Member',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Member since Jan 2024',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '1,250',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Points',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final menuItems = <Map<String, dynamic>>[
      {'icon': Icons.shopping_bag_outlined, 'title': 'My Orders', 'badge': '3'},
      {'icon': Icons.star_outline, 'title': 'My Reviews'},
      {'icon': Icons.location_on_outlined, 'title': 'Shipping Addresses'},
      {'icon': Icons.credit_card_outlined, 'title': 'Payment Methods'},
      {'icon': Icons.notifications_outlined, 'title': 'Notifications'},
      {'icon': Icons.settings_outlined, 'title': 'Settings'},
      {'icon': Icons.help_outline, 'title': 'Help & Support'},
      {'icon': Icons.info_outline, 'title': 'About'},
      {'icon': Icons.logout, 'title': 'Logout', 'isLogout': true},
    ];

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: menuItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == menuItems.length - 1;
          final isLogout = item['isLogout'] == true;

          return Column(
            children: [
              ListTile(
                leading: Icon(
                  item['icon'] as IconData,
                  color: isLogout ? AppColors.error : AppColors.primaryBlue,
                ),
                title: Text(
                  item['title'] as String,
                  style: TextStyle(
                    color: isLogout ? AppColors.error : null,
                  ),
                ),
                trailing: item['badge'] != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentCoral,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item['badge'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              if (!isLast) const Divider(height: 1),
            ],
          );
        }).toList(),
      ),
    );
  }
}
