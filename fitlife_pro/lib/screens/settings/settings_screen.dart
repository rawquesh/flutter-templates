import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';

class SettingsScreen extends StatefulWidget {
  final Function(ThemeMode)? onThemeChanged;

  const SettingsScreen({super.key, this.onThemeChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedThemeIndex = 1;
  bool _notificationsEnabled = true;
  bool _workoutReminders = true;
  bool _dailyGoalsReminder = true;
  final String _selectedUnit = 'Metric';
  final int _defaultRestTime = 60;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5F7),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(isDark)),
            SliverToBoxAdapter(child: _buildThemeSection(isDark)),
            SliverToBoxAdapter(child: _buildAccountSection(isDark)),
            SliverToBoxAdapter(child: _buildWorkoutPreferences(isDark)),
            SliverToBoxAdapter(child: _buildNotificationSettings(isDark)),
            SliverToBoxAdapter(child: _buildAppSection(isDark)),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Customize your experience',
            style: TextStyle(
              color: isDark ? Colors.white60 : Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildThemeSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.palette, color: AppColors.primaryOrange, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Theme',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildThemeOption(0, Icons.light_mode, 'Light', isDark),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildThemeOption(1, Icons.view_day, 'Hybrid', isDark),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildThemeOption(2, Icons.dark_mode, 'Dark', isDark),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildThemeOption(int index, IconData icon, String label, bool isDark) {
    final isSelected = _selectedThemeIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedThemeIndex = index);
        _applyTheme(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryOrange.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryOrange
                : (isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade300),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryOrange.withValues(alpha: 0.2)
                    : (isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade100),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primaryOrange : (isDark ? Colors.white70 : Colors.grey),
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primaryOrange : (isDark ? Colors.white : Colors.grey),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primaryOrange,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection(bool isDark) {
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
          _buildSectionHeader('Account Settings', Icons.person, isDark),
          const SizedBox(height: 16),
          _buildSettingsTile(
            'Edit Profile',
            'Change your name, photo, and info',
            Icons.edit,
            isDark,
          ),
          _buildSettingsTile(
            'Change Password',
            'Update your password',
            Icons.lock,
            isDark,
          ),
          _buildSettingsTile(
            'Units Preference',
            _selectedUnit,
            Icons.straighten,
            isDark,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildWorkoutPreferences(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Workout Preferences', Icons.fitness_center, isDark),
          const SizedBox(height: 16),
          _buildSettingsTile(
            'Default Rest Time',
            '$_defaultRestTime seconds',
            Icons.timer,
            isDark,
          ),
          _buildSettingsTile(
            'Workout Reminders',
            'Get reminded to work out',
            Icons.alarm,
            isDark,
          ),
          _buildSettingsTile(
            'Daily Goals',
            'Set and track daily targets',
            Icons.flag,
            isDark,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }

  Widget _buildNotificationSettings(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Notifications', Icons.notifications, isDark),
          const SizedBox(height: 16),
          _buildToggleTile(
            'Push Notifications',
            'Receive app notifications',
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
            isDark,
          ),
          _buildToggleTile(
            'Workout Reminders',
            'Daily workout notifications',
            _workoutReminders,
            (value) => setState(() => _workoutReminders = value),
            isDark,
          ),
          _buildToggleTile(
            'Daily Goals Reminder',
            'Remind about unfinished goals',
            _dailyGoalsReminder,
            (value) => setState(() => _dailyGoalsReminder = value),
            isDark,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }

  Widget _buildAppSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('App', Icons.info, isDark),
          const SizedBox(height: 16),
          _buildSettingsTile(
            'Language',
            'English',
            Icons.language,
            isDark,
          ),
          _buildSettingsTile(
            'Privacy Policy',
            'Read our privacy policy',
            Icons.privacy_tip,
            isDark,
          ),
          _buildSettingsTile(
            'Terms of Service',
            'Read our terms',
            Icons.description,
            isDark,
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'FitLife Pro v1.0.0',
              style: TextStyle(
                color: isDark ? Colors.white38 : Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms, duration: 600.ms);
  }

  Widget _buildSectionHeader(String title, IconData icon, bool isDark) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryOrange.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primaryOrange, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF1A1A2E),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(String title, String subtitle, IconData icon, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.accentBlue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.accentBlue, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? Colors.white60 : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: isDark ? Colors.white38 : Colors.grey),
        ],
      ),
    );
  }

  Widget _buildToggleTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? Colors.white60 : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryOrange;
              }
              return Colors.grey;
            }),
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryOrange.withValues(alpha: 0.5);
              }
              return Colors.grey.withValues(alpha: 0.3);
            }),
          ),
        ],
      ),
    );
  }

  void _applyTheme(int index) {
    switch (index) {
      case 0:
        widget.onThemeChanged?.call(ThemeMode.light);
        break;
      case 1:
        widget.onThemeChanged?.call(ThemeMode.dark);
        break;
      case 2:
        widget.onThemeChanged?.call(ThemeMode.dark);
        break;
    }
  }
}
