import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/glass_bottom_nav.dart';
import '../widgets/glass_sidebar.dart';
import '../theme/app_theme.dart';
import 'dashboard/dashboard_screen.dart';
import 'doctors/doctors_screen.dart';
import 'appointments/appointments_screen.dart';
import 'profile/profile_screen.dart';
import 'health_records/health_records_screen.dart';
import 'medicines/medicines_screen.dart';
import 'health_tips/health_tips_screen.dart';
import 'video_consultation/video_consultation_screen.dart';
import 'symptom_checker/symptom_checker_screen.dart';
import 'emergency/emergency_screen.dart';
import 'health_articles/health_articles_screen.dart';
import 'settings/settings_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;
  int _sidebarIndex = 0;
  bool _isDark = true;

  final List<Widget> _allScreens = const [
    DashboardScreen(),
    DoctorsScreen(),
    AppointmentsScreen(),
    HealthRecordsScreen(),
    MedicinesScreen(),
    HealthTipsScreen(),
    VideoConsultationScreen(),
    SymptomCheckerScreen(),
    EmergencyScreen(),
    HealthArticlesScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
      _sidebarIndex = index;
    });
  }

  void _onSidebarItemTap(int index) {
    setState(() {
      _sidebarIndex = index;
      if (index < 4) {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final showSidebar = screenWidth > 800;

    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: showSidebar ? null : _buildDrawer(),
      body: Row(
        children: [
          if (showSidebar)
            GlassSidebar(
              selectedIndex: _sidebarIndex,
              onItemTap: _onSidebarItemTap,
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: _allScreens[_sidebarIndex],
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
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
      selectedIndex: _sidebarIndex,
      onItemTap: (index) {
        _onSidebarItemTap(index);
        Navigator.pop(context);
      },
      onThemeToggle: () {
        setState(() => _isDark = !_isDark);
        Navigator.pop(context);
      },
      currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
      isDark: _isDark,
      child: const SizedBox(),
    );
  }
}
