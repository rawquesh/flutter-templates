import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SettingsScreen extends StatefulWidget {
  final Function(int) onThemeChanged;

  const SettingsScreen({super.key, required this.onThemeChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedTheme = 1;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Appearance', isDark),
            const SizedBox(height: 12),
            _buildThemeSelector(isDark),
            const SizedBox(height: 24),
            _buildSectionTitle('Account', isDark),
            const SizedBox(height: 12),
            _buildSettingsTile('Edit Profile', Icons.person, isDark),
            _buildSettingsTile('Change Password', Icons.lock, isDark),
            _buildSettingsTile('Change Phone Number', Icons.phone, isDark),
            const SizedBox(height: 24),
            _buildSectionTitle('Notifications', isDark),
            const SizedBox(height: 12),
            _buildSwitchTile('Push Notifications', Icons.notifications, true, isDark),
            _buildSwitchTile('Email Notifications', Icons.email, false, isDark),
            _buildSwitchTile('SMS Notifications', Icons.sms, false, isDark),
            const SizedBox(height: 24),
            _buildSectionTitle('Preferences', isDark),
            const SizedBox(height: 12),
            _buildSettingsTile('Language', Icons.language, isDark, trailing: 'English'),
            _buildSettingsTile('Default Address', Icons.location_on, isDark),
            _buildSettingsTile('Privacy & Security', Icons.security, isDark),
            const SizedBox(height: 24),
            _buildSectionTitle('About', isDark),
            const SizedBox(height: 12),
            _buildSettingsTile('Terms of Service', Icons.description, isDark),
            _buildSettingsTile('Privacy Policy', Icons.policy, isDark),
            _buildSettingsTile('App Version', Icons.info, isDark, trailing: '1.0.0'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryOrange,
      ),
    );
  }

  Widget _buildThemeSelector(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theme',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildThemeOption(
                  0,
                  'Light',
                  Icons.wb_sunny,
                  const Color(0xFFFFF8F0),
                  isDark,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildThemeOption(
                  1,
                  'Hybrid',
                  Icons.brightness_2,
                  const Color(0xFF2C2C2C),
                  isDark,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildThemeOption(
                  2,
                  'Dark',
                  Icons.nightlight_round,
                  const Color(0xFF151515),
                  isDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(int index, String label, IconData icon, Color previewColor, bool isDark) {
    final isSelected = _selectedTheme == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedTheme = index);
        widget.onThemeChanged(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryOrange.withValues(alpha: 0.1)
              : (isDark ? Colors.black26 : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: AppColors.primaryOrange, width: 2)
              : null,
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: previewColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Icon(icon, size: 20, color: previewColor.computeLuminance() > 0.5 ? Colors.black : Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? AppColors.primaryOrange
                    : (isDark ? Colors.white : AppColors.textPrimaryLight),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(String title, IconData icon, bool isDark, {String? trailing}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryOrange),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null)
              Text(
                trailing,
                style: TextStyle(
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: isDark ? Colors.white54 : Colors.black54),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildSwitchTile(String title, IconData icon, bool value, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryOrange),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: (v) {},
          activeTrackColor: AppColors.primaryOrange.withValues(alpha: 0.5),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryOrange;
            }
            return Colors.grey;
          }),
        ),
      ),
    );
  }
}
