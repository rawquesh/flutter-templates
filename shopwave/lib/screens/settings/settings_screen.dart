import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedTheme = 1;
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildThemeSection(context),
            const SizedBox(height: 24),
            _buildAccountSection(context),
            const SizedBox(height: 24),
            _buildNotificationSection(context),
            const SizedBox(height: 24),
            _buildLanguageCurrencySection(context),
            const SizedBox(height: 24),
            _buildPrivacySection(context),
            const SizedBox(height: 24),
            _buildAboutSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appearance',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildThemeOption(
                context,
                0,
                'Light Theme',
                Icons.wb_sunny,
                'Classic bright appearance',
              ),
              const Divider(height: 1),
              _buildThemeOption(
                context,
                1,
                'Dark Sidebar',
                Icons.nights_stay,
                'Dark navigation with light content',
              ),
              const Divider(height: 1),
              _buildThemeOption(
                context,
                2,
                'Dark Theme',
                Icons.dark_mode,
                'Full dark mode',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeOption(BuildContext context, int index, String title, IconData icon, String subtitle) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isSelected = _selectedTheme == index;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withValues(alpha: 0.1)
              : (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.grey.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.primaryBlue : null,
        ),
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
      ),
      trailing: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: isSelected ? AppColors.primaryBlue : null,
      ),
      onTap: () => setState(() => _selectedTheme = index),
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Settings',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Personal Information'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text('Shipping Addresses'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.credit_card_outlined),
                title: const Text('Payment Methods'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SwitchListTile(
                secondary: const Icon(Icons.notifications_outlined),
                title: const Text('Enable Notifications'),
                value: _notificationsEnabled,
                onChanged: (value) => setState(() => _notificationsEnabled = value),
                activeTrackColor: AppColors.primaryBlue.withValues(alpha: 0.5),
              ),
              if (_notificationsEnabled) ...[
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.email_outlined),
                  title: const Text('Email Notifications'),
                  value: _emailNotifications,
                  onChanged: (value) => setState(() => _emailNotifications = value),
                  activeTrackColor: AppColors.primaryBlue.withValues(alpha: 0.5),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.phone_android),
                  title: const Text('Push Notifications'),
                  value: _pushNotifications,
                  onChanged: (value) => setState(() => _pushNotifications = value),
                  activeTrackColor: AppColors.primaryBlue.withValues(alpha: 0.5),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageCurrencySection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Language & Currency',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedLanguage,
                      style: TextStyle(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => _showLanguagePicker(context),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Currency'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedCurrency,
                      style: TextStyle(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => _showCurrencyPicker(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final languages = ['English', 'Spanish', 'French', 'German', 'Chinese', 'Japanese'];
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            trailing: _selectedLanguage == languages[index]
                ? const Icon(Icons.check, color: AppColors.primaryBlue)
                : null,
            onTap: () {
              setState(() => _selectedLanguage = languages[index]);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  void _showCurrencyPicker(BuildContext context) {
    final currencies = ['USD', 'EUR', 'GBP', 'JPY', 'CNY', 'INR'];
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(currencies[index]),
            trailing: _selectedCurrency == currencies[index]
                ? const Icon(Icons.check, color: AppColors.primaryBlue)
                : null,
            onTap: () {
              setState(() => _selectedCurrency = currencies[index]);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildPrivacySection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy & Security',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.lock_outlined),
                title: const Text('Change Password'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.security_outlined),
                title: const Text('Two-Factor Authentication'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outlined),
                title: const Text('App Version'),
                trailing: Text(
                  '1.0.0',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Help & Support'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
