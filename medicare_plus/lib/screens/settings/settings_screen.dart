import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/glass_switch.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDark = true;
  AppThemeMode _selectedTheme = AppThemeMode.dark;

  final Map<String, bool> _notifications = {
    'Push Notifications': true,
    'Email Notifications': true,
    'Appointment Reminders': true,
    'Health Tips': false,
    'Newsletter': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 11,
              onItemTap: (_) {},
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildThemeSection(),
                        const SizedBox(height: 24),
                        _buildNotificationSettings(),
                        const SizedBox(height: 24),
                        _buildAccountSettings(),
                        const SizedBox(height: 24),
                        _buildAppInfo(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: 0,
        onTap: (_) {},
        items: const [
          GlassBottomNavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
          GlassBottomNavItem(icon: Icons.medical_services_outlined, activeIcon: Icons.medical_services, label: 'Doctors'),
          GlassBottomNavItem(icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today, label: 'Appointments'),
          GlassBottomNavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return GlassDrawer(
      selectedIndex: 11,
      onItemTap: (_) {},
      onThemeToggle: () => setState(() => _isDark = !_isDark),
      currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
      isDark: _isDark,
      child: const SizedBox(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text('Settings', style: TextStyle(color: _isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
      actions: [
        GlassThemeToggle(
          currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
          onChanged: (mode) => setState(() => _isDark = mode == AppThemeMode.dark),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildThemeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Appearance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 8),
        Text('Choose your preferred theme', style: TextStyle(color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _ThemeCard(title: 'Light', icon: Icons.light_mode, isSelected: _selectedTheme == AppThemeMode.light, onTap: () => setState(() => _selectedTheme = AppThemeMode.light), isDark: _isDark, previewColor: Colors.white)),
            const SizedBox(width: 12),
            Expanded(child: _ThemeCard(title: 'Dark Sidebar', icon: Icons.view_sidebar, isSelected: _selectedTheme == AppThemeMode.darkSidebar, onTap: () => setState(() => _selectedTheme = AppThemeMode.darkSidebar), isDark: _isDark, previewColor: AppColors.sidebarDark, isDefault: true)),
            const SizedBox(width: 12),
            Expanded(child: _ThemeCard(title: 'Dark', icon: Icons.dark_mode, isSelected: _selectedTheme == AppThemeMode.dark, onTap: () => setState(() => _selectedTheme = AppThemeMode.dark), isDark: _isDark, previewColor: AppColors.backgroundDark)),
          ],
        ),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildNotificationSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notifications', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        GlassCard(
          child: Column(
            children: _notifications.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                      child: Icon(_getNotificationIcon(entry.key), color: AppColors.primaryBlue, size: 20),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: Text(entry.key, style: TextStyle(color: _isDark ? Colors.white : AppColors.textPrimaryLight))),
                    GlassToggleSwitch(value: entry.value, onChanged: (value) {
                      setState(() => _notifications[entry.key] = value);
                    }),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildAccountSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        GlassCard(
          child: Column(
            children: [
              _SettingsItem(icon: Icons.language, title: 'Language', subtitle: 'English (US)', onTap: () {}),
              const Divider(height: 24),
              _SettingsItem(icon: Icons.privacy_tip, title: 'Privacy & Security', subtitle: 'Manage your data', onTap: () {}),
              const Divider(height: 24),
              _SettingsItem(icon: Icons.help, title: 'Help & Support', subtitle: 'FAQs, contact us', onTap: () {}),
              const Divider(height: 24),
              _SettingsItem(icon: Icons.info, title: 'About', subtitle: 'Version 1.0.0', onTap: () {}),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }

  Widget _buildAppInfo() {
    return GlassCard(
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.favorite, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 16),
          Text('MediCare+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
          const SizedBox(height: 4),
          Text('Version 1.0.0', style: TextStyle(color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          const SizedBox(height: 16),
          Text('Your trusted health companion', style: TextStyle(color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: const Icon(Icons.facebook, color: AppColors.primaryBlue), onPressed: () {}),
              IconButton(icon: const Icon(Icons.camera_alt, color: AppColors.primaryBlue), onPressed: () {}),
              IconButton(icon: const Icon(Icons.link, color: AppColors.primaryBlue), onPressed: () {}),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 400.ms);
  }

  IconData _getNotificationIcon(String key) {
    switch (key) {
      case 'Push Notifications':
        return Icons.notifications;
      case 'Email Notifications':
        return Icons.email;
      case 'Appointment Reminders':
        return Icons.calendar_today;
      case 'Health Tips':
        return Icons.lightbulb;
      case 'Newsletter':
        return Icons.newspaper;
      default:
        return Icons.settings;
    }
  }
}

class _ThemeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;
  final Color previewColor;
  final bool isDefault;

  const _ThemeCard({required this.title, required this.icon, required this.isSelected, required this.onTap, required this.isDark, required this.previewColor, this.isDefault = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue.withOpacity(0.1) : (isDark ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.primaryBlue : (isDark ? Colors.white.withOpacity(0.1) : AppColors.dividerLight), width: isSelected ? 2 : 1),
        ),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(color: previewColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: isDark ? Colors.white.withOpacity(0.2) : AppColors.dividerLight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 20, height: double.infinity, decoration: BoxDecoration(color: previewColor == Colors.white ? Colors.grey[300] : Colors.grey[800], borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)))),
                  const SizedBox(width: 1),
                  Container(width: 39, height: double.infinity, decoration: BoxDecoration(color: previewColor, borderRadius: const BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)))),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Icon(icon, color: isSelected ? AppColors.primaryBlue : (isDark ? Colors.white70 : Colors.grey)),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? AppColors.primaryBlue : (isDark ? Colors.white : AppColors.textPrimaryLight))),
            if (isDefault) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: AppColors.success.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                child: const Text('Default', style: TextStyle(fontSize: 10, color: AppColors.success)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsItem({required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: AppColors.primaryBlue, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
