import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_avatar.dart';
import '../../widgets/glass_badge.dart';
import '../settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Function(ThemeMode)? onThemeChanged;

  const ProfileScreen({super.key, this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5F7),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context, isDark)),
          SliverToBoxAdapter(child: _buildStats(isDark)),
          SliverToBoxAdapter(child: _buildBodyStats(isDark)),
          SliverToBoxAdapter(child: _buildAchievements(isDark)),
          SliverToBoxAdapter(child: _buildMenuItems(context, isDark)),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(
                        onThemeChanged: onThemeChanged,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.settings, color: textColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGradient,
                ),
              ),
              const GlassAvatar(
                placeholderText: 'JD',
                size: 90,
                showBorder: false,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    shape: BoxShape.circle,
                    border: Border.all(color: isDark ? const Color(0xFF0D0D1A) : Colors.white, width: 3),
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Member since January 2024',
            style: TextStyle(
              color: subtitleColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text('Level 12', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 200,
            child: XpBadge(currentXp: 750, targetXp: 1000),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildStats(bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;
    final dividerColor = isDark ? Colors.white.withValues(alpha: 0.2) : Colors.grey.shade300;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('156', 'Workouts', textColor, subtitleColor),
          _buildStatDivider(dividerColor),
          _buildStatItem('48h', 'Time Trained', textColor, subtitleColor),
          _buildStatDivider(dividerColor),
          _buildStatItem('12.5k', 'Calories', textColor, subtitleColor),
          _buildStatDivider(dividerColor),
          _buildStatItem('21', 'Day Streak', textColor, subtitleColor),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildStatItem(String value, String label, Color valueColor, Color labelColor) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: labelColor, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildStatDivider(Color color) {
    return Container(
      height: 40,
      width: 1,
      color: color,
    );
  }

  Widget _buildBodyStats(bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;
    final bgColor = isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade100;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body Stats',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildBodyStatItem('Height', '178 cm', textColor, subtitleColor)),
              Expanded(child: _buildBodyStatItem('Weight', '74 kg', textColor, subtitleColor)),
              Expanded(child: _buildBodyStatItem('Body Fat', '15%', textColor, subtitleColor)),
              Expanded(child: _buildBodyStatItem('BMI', '23.4', textColor, subtitleColor)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Goal Weight', style: TextStyle(color: subtitleColor, fontSize: 12)),
                        Text('72 kg', style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.8,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildBodyStatItem(String label, String value, Color valueColor, Color labelColor) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: labelColor, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildAchievements(bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Achievements',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildAchievementCard(Icons.fitness_center, 'First Workout', 'Completed first workout', AppColors.primaryOrange, isDark),
                _buildAchievementCard(Icons.local_fire_department, '7 Day Streak', 'Exercised 7 days in a row', AppColors.warning, isDark),
                _buildAchievementCard(Icons.emoji_events, 'Champion', 'Won a challenge', AppColors.accentBlue, isDark),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }

  Widget _buildAchievementCard(IconData icon, String title, String subtitle, Color color, bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? color.withValues(alpha: 0.15) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? color.withValues(alpha: 0.3) : Colors.grey.shade200),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: 11, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(color: subtitleColor, fontSize: 9),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;

    final menuItems = [
      {'icon': Icons.palette, 'title': 'Theme', 'subtitle': 'Light, Dark, Dark Sidebar', 'route': 'settings'},
      {'icon': Icons.person, 'title': 'My Profile', 'subtitle': 'Edit your information'},
      {'icon': Icons.history, 'title': 'Workout History', 'subtitle': 'View past workouts'},
      {'icon': Icons.emoji_events, 'title': 'Achievements', 'subtitle': 'Your badges and rewards'},
      {'icon': Icons.notifications, 'title': 'Notifications', 'subtitle': 'Manage reminders'},
      {'icon': Icons.help, 'title': 'Help & Support', 'subtitle': 'Get assistance'},
      {'icon': Icons.info, 'title': 'About', 'subtitle': 'App information'},
      {'icon': Icons.logout, 'title': 'Logout', 'subtitle': 'Sign out of your account', 'isLogout': true},
    ];

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: menuItems.map((item) {
          final isLogout = item['isLogout'] == true;
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isLogout
                        ? AppColors.error.withValues(alpha: 0.1)
                        : AppColors.primaryOrange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    color: isLogout ? AppColors.error : AppColors.primaryOrange,
                    size: 20,
                  ),
                ),
                title: Text(
                  item['title'] as String,
                  style: TextStyle(
                    color: isLogout ? AppColors.error : textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  item['subtitle'] as String,
                  style: TextStyle(color: subtitleColor, fontSize: 12),
                ),
                trailing: Icon(Icons.chevron_right, color: isDark ? Colors.white38 : Colors.grey),
                onTap: () {
                  final route = item['route'] as String?;
                  if (route == 'settings') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen(
                        onThemeChanged: onThemeChanged,
                      )),
                    );
                  }
                },
              ),
              if (item != menuItems.last)
                Divider(color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade200),
            ],
          );
        }).toList(),
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }
}
