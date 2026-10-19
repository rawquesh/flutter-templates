import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_avatar.dart';
import '../../widgets/glass_button.dart';

class ProfileScreen extends StatelessWidget {
  final bool isDark;

  const ProfileScreen({super.key, required this.isDark});

  static final Map<String, dynamic> _userData = {
    'name': 'John Doe',
    'email': 'john.doe@email.com',
    'phone': '+1 (555) 123-4567',
    'memberSince': 'January 2024',
    'healthScore': 85,
    'appointments': 12,
    'reports': 8,
    'medicines': 5,
    'consultations': 7,
    'bloodType': 'O+',
    'allergies': ['Penicillin', 'Peanuts'],
    'conditions': ['Asthma'],
    'medications': ['Inhaler', 'Vitamin D'],
  };

  static final List<_SettingItem> _settings = [
    _SettingItem(icon: Icons.person_outline, title: 'Edit Profile', subtitle: 'Update your personal information'),
    _SettingItem(icon: Icons.emergency_outlined, title: 'Emergency Info', subtitle: 'Blood type, allergies, conditions'),
    _SettingItem(icon: Icons.notifications_outlined, title: 'Notifications', subtitle: 'Manage your alerts'),
    _SettingItem(icon: Icons.privacy_tip_outlined, title: 'Privacy & Security', subtitle: 'Password, biometric login'),
    _SettingItem(icon: Icons.help_outline, title: 'Help & Support', subtitle: 'FAQs, contact us'),
    _SettingItem(icon: Icons.info_outline, title: 'About', subtitle: 'App version, terms'),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          title: Text(
            'My Profile',
            style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold),
          ),
          actions: const [SizedBox(width: 16)],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildProfileHeader(),
                const SizedBox(height: 24),
                _buildStatsRow(),
                const SizedBox(height: 24),
                _buildHealthSummary(),
                const SizedBox(height: 24),
                _buildSettingsList(),
                const SizedBox(height: 24),
                _buildLogoutButton(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return GlassCard(
      child: Column(
        children: [
          Stack(
            children: [
              GlassAvatar(size: 100, name: _userData['name'], showGlow: true),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight, width: 3),
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(_userData['name'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
          const SizedBox(height: 4),
          Text(_userData['email'], style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          Text(_userData['phone'], style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          const SizedBox(height: 12),
          Text('Member since ${_userData['memberSince']}', style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text('Health Score: ${_userData['healthScore']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1));
  }

  Widget _buildStatsRow() {
    final stats = [
      _StatItem(icon: Icons.calendar_today, value: '${_userData['appointments']}', label: 'Appointments'),
      _StatItem(icon: Icons.folder, value: '${_userData['reports']}', label: 'Reports'),
      _StatItem(icon: Icons.medication, value: '${_userData['medicines']}', label: 'Medicines'),
      _StatItem(icon: Icons.videocam, value: '${_userData['consultations']}', label: 'Consults'),
    ];

    return Row(
      children: stats.asMap().entries.map((entry) {
        final index = entry.key;
        final stat = entry.value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: index > 0 ? 8 : 0),
            child: GlassCard(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Icon(stat.icon, color: AppColors.primaryBlue, size: 24),
                  const SizedBox(height: 8),
                  Text(stat.value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
                  const SizedBox(height: 4),
                  Text(stat.label, style: TextStyle(fontSize: 11, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight), textAlign: TextAlign.center),
                ],
              ),
            ),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms),
        );
      }).toList(),
    );
  }

  Widget _buildHealthSummary() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.error.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.medical_information, color: AppColors.error),
              ),
              const SizedBox(width: 12),
              Text('Health Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow('Blood Type', _userData['bloodType'], Icons.bloodtype, AppColors.error),
          const SizedBox(height: 12),
          _buildInfoRow('Allergies', (_userData['allergies'] as List).join(', '), Icons.warning_amber, AppColors.warning),
          const SizedBox(height: 12),
          _buildInfoRow('Conditions', (_userData['conditions'] as List).join(', '), Icons.healing, AppColors.primaryBlue),
          const SizedBox(height: 12),
          _buildInfoRow('Medications', (_userData['medications'] as List).join(', '), Icons.medication, AppColors.teal),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 400.ms);
  }

  Widget _buildInfoRow(String label, String value, IconData icon, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
              Text(value, style: TextStyle(fontWeight: FontWeight.w500, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        ..._settings.asMap().entries.map((entry) {
          final index = entry.key;
          final setting = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GlassCard(
              padding: const EdgeInsets.all(16),
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: Icon(setting.icon, color: AppColors.primaryBlue, size: 22),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(setting.title, style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
                        Text(setting.subtitle, style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                ],
              ),
            ),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
        }),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return GlassButton(text: 'Logout', variant: GlassButtonVariant.outline, icon: Icons.logout, isExpanded: true, onPressed: () {}).animate().fadeIn(delay: 1000.ms, duration: 400.ms);
  }
}

class _StatItem {
  final IconData icon;
  final String value;
  final String label;
  _StatItem({required this.icon, required this.value, required this.label});
}

class _SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  _SettingItem({required this.icon, required this.title, required this.subtitle});
}
