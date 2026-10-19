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

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return DashboardScreen(isDark: _isDark);
      case 1:
        return DoctorsScreen(isDark: _isDark);
      case 2:
        return AppointmentsScreen(isDark: _isDark);
      case 3:
        return HealthRecordsScreen(isDark: _isDark);
      case 4:
        return MedicinesScreen(isDark: _isDark);
      case 5:
        return HealthTipsScreen(isDark: _isDark);
      case 6:
        return VideoConsultationScreen(isDark: _isDark);
      case 7:
        return SymptomCheckerScreen(isDark: _isDark);
      case 8:
        return EmergencyScreen(isDark: _isDark);
      case 9:
        return HealthArticlesScreen(isDark: _isDark);
      case 10:
        return ProfileScreen(isDark: _isDark);
      case 11:
        return SettingsScreen(isDark: _isDark);
      default:
        return DashboardScreen(isDark: _isDark);
    }
  }

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
            child: _getScreen(_sidebarIndex),
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
