import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_button.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/emergency_contact_card.dart';
import '../../theme/app_theme.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  bool _isDark = true;

  final Map<String, dynamic> _medicalInfo = {
    'bloodType': 'O+',
    'allergies': ['Penicillin', 'Peanuts'],
    'conditions': ['Asthma'],
    'medications': ['Inhaler', 'Vitamin D'],
  };

  final List<_EmergencyContact> _emergencyContacts = [
    _EmergencyContact(name: 'Jane Doe', relationship: 'Wife', phone: '+1 (555) 987-6543'),
    _EmergencyContact(name: 'Robert Doe', relationship: 'Father', phone: '+1 (555) 456-7890'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 8,
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
                        _buildEmergencyButton(),
                        const SizedBox(height: 24),
                        _buildEmergencyServices(),
                        const SizedBox(height: 24),
                        _buildQuickAccess(),
                        const SizedBox(height: 24),
                        _buildMedicalInfo(),
                        const SizedBox(height: 24),
                        _buildICEContacts(),
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
      selectedIndex: 8,
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
      title: Text('Emergency', style: TextStyle(color: _isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
      actions: [
        GlassThemeToggle(
          currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
          onChanged: (mode) => setState(() => _isDark = mode == AppThemeMode.dark),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildEmergencyButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.error, Color(0xFFFF5252)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: AppColors.error.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        children: [
          const Icon(Icons.emergency, color: Colors.white, size: 48),
          const SizedBox(height: 16),
          const Text('EMERGENCY', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 8),
          const Text('Tap to call emergency services', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.error, padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16)),
            child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.phone), SizedBox(width: 8), Text('CALL 911', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1))]),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1));
  }

  Widget _buildEmergencyServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Emergency Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: EmergencyServiceCard(title: 'Emergency Services', icon: Icons.local_hospital, color: AppColors.error, onTap: () {})),
            const SizedBox(width: 12),
            Expanded(child: EmergencyServiceCard(title: 'Ambulance', icon: Icons.directions_car, color: AppColors.warning, onTap: () {})),
            const SizedBox(width: 12),
            Expanded(child: EmergencyServiceCard(title: 'Poison Control', icon: Icons.warning, color: AppColors.primaryBlue, onTap: () {})),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildQuickAccess() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Access', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        GlassCard(
          child: Column(
            children: [
              _QuickAccessItem(icon: Icons.local_hospital, title: 'Nearest Hospital', subtitle: '1.2 miles away', color: AppColors.error),
              const Divider(height: 24),
              _QuickAccessItem(icon: Icons.timer, title: 'ER Wait Times', subtitle: 'Average: 45 minutes', color: AppColors.warning),
              const Divider(height: 24),
              _QuickAccessItem(icon: Icons.local_pharmacy, title: '24/7 Pharmacies', subtitle: '3 nearby', color: AppColors.success),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }

  Widget _buildMedicalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Medical Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
            GlassButton(text: 'Edit', variant: GlassButtonVariant.secondary, height: 36, onPressed: () {}),
          ],
        ),
        const SizedBox(height: 16),
        MedicalInfoCard(
          bloodType: _medicalInfo['bloodType'],
          allergies: List<String>.from(_medicalInfo['allergies']),
          conditions: List<String>.from(_medicalInfo['conditions']),
          medications: List<String>.from(_medicalInfo['medications']),
          isDark: _isDark,
        ),
      ],
    ).animate().fadeIn(delay: 300.ms, duration: 400.ms);
  }

  Widget _buildICEContacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ICE Contacts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 8),
        Text('In Case of Emergency', style: TextStyle(color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
        const SizedBox(height: 16),
        ..._emergencyContacts.asMap().entries.map((entry) {
          final index = entry.key;
          final contact = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: EmergencyContactCard(
              name: contact.name,
              phone: contact.phone,
              relationship: contact.relationship,
              isICE: true,
              isDark: _isDark,
              onCallTap: () {},
            ),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
        }),
      ],
    ).animate().fadeIn(delay: 400.ms, duration: 400.ms);
  }
}

class _EmergencyContact {
  final String name;
  final String relationship;
  final String phone;

  _EmergencyContact({required this.name, required this.relationship, required this.phone});
}

class _QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _QuickAccessItem({required this.icon, required this.title, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color, size: 22),
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
    );
  }
}
