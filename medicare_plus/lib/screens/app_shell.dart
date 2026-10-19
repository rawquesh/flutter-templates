import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/theme_controller.dart';
import '../widgets/glass_bottom_nav.dart';
import '../widgets/glass_sidebar.dart';
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

  /// Maps bottom-nav tab index -> screen index used by [_getScreen].
  /// Tabs are Home(0), Doctors(1), Appointments(2), Profile(3 -> screen 10).
  static const List<int> _navMap = [0, 1, 2, 10];

  Widget _getScreen(int index, bool isDark) {
    switch (index) {
      case 0:
        return DashboardScreen(isDark: isDark);
      case 1:
        return DoctorsScreen(isDark: isDark);
      case 2:
        return AppointmentsScreen(isDark: isDark);
      case 3:
        return HealthRecordsScreen(isDark: isDark);
      case 4:
        return MedicinesScreen(isDark: isDark);
      case 5:
        return HealthTipsScreen(isDark: isDark);
      case 6:
        return VideoConsultationScreen(isDark: isDark);
      case 7:
        return SymptomCheckerScreen(isDark: isDark);
      case 8:
        return EmergencyScreen(isDark: isDark);
      case 9:
        return HealthArticlesScreen(isDark: isDark);
      case 10:
        return ProfileScreen(isDark: isDark);
      case 11:
        return SettingsScreen(isDark: isDark);
      default:
        return DashboardScreen(isDark: isDark);
    }
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
      _sidebarIndex = _navMap[index];
    });
  }

  void _onSidebarItemTap(int index) {
    setState(() {
      _sidebarIndex = index;
      // Keep the bottom-nav highlight in sync when the tapped screen has a
      // corresponding tab; otherwise keep the previous highlight.
      final tabIndex = _navMap.indexOf(index);
      if (tabIndex != -1) {
        _currentIndex = tabIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (context, _) {
        final isDark = ThemeController.instance.isDark;
        final screenWidth = MediaQuery.of(context).size.width;
        final showSidebar = screenWidth > 800;

        return Scaffold(
          backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          drawer: showSidebar ? null : _buildDrawer(isDark),
          body: Row(
            children: [
              if (showSidebar)
                GlassSidebar(
                  selectedIndex: _sidebarIndex,
                  onItemTap: _onSidebarItemTap,
                  onThemeChanged: ThemeController.instance.setDark,
                  isDark: isDark,
                ),
              Expanded(
                child: _getScreen(_sidebarIndex, isDark),
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
      },
    );
  }

  Widget _buildDrawer(bool isDark) {
    return GlassDrawer(
      selectedIndex: _sidebarIndex,
      // GlassDrawer pops the drawer itself after a tap — no extra pop here,
      // otherwise the AppShell route would be popped too.
      onItemTap: _onSidebarItemTap,
      onThemeChanged: ThemeController.instance.setDark,
      isDark: isDark,
      child: const SizedBox(),
    );
  }
}
