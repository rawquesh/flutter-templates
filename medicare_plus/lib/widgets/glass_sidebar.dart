
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';

class GlassSidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTap;
  final ValueChanged<bool> onThemeChanged;
  final bool isDark;

  const GlassSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
    required this.onThemeChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.sidebarWidth,
      decoration: BoxDecoration(
        color: isDark ? AppColors.sidebarDark : AppColors.sidebarLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
            blurRadius: 20,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildMenuList(context),
          ),
          _buildThemeSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 24,
        left: 20,
        right: 20,
        bottom: 24,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MediCare+',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Your Health Partner',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    final menuItems = [
      _MenuItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Dashboard'),
      _MenuItem(icon: Icons.medical_services_outlined, activeIcon: Icons.medical_services, label: 'Doctors'),
      _MenuItem(icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today, label: 'Appointments'),
      _MenuItem(icon: Icons.folder_outlined, activeIcon: Icons.folder, label: 'Health Records'),
      _MenuItem(icon: Icons.medication_outlined, activeIcon: Icons.medication, label: 'Medicines'),
      _MenuItem(icon: Icons.lightbulb_outline, activeIcon: Icons.lightbulb, label: 'Health Tips'),
      _MenuItem(icon: Icons.videocam_outlined, activeIcon: Icons.videocam, label: 'Video Consultation'),
      _MenuItem(icon: Icons.checklist_outlined, activeIcon: Icons.checklist, label: 'Symptom Checker'),
      _MenuItem(icon: Icons.emergency_outlined, activeIcon: Icons.emergency, label: 'Emergency'),
      _MenuItem(icon: Icons.article_outlined, activeIcon: Icons.article, label: 'Health Articles'),
      _MenuItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
      _MenuItem(icon: Icons.settings_outlined, activeIcon: Icons.settings, label: 'Settings'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        final isSelected = selectedIndex == index;

        return _SidebarMenuItem(
          item: item,
          isSelected: isSelected,
          onTap: () => onItemTap(index),
          isDark: isDark,
        );
      },
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white.withValues(alpha: 0.1) : AppColors.dividerLight,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Dark mode',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: isDark,
            onChanged: onThemeChanged,
            activeThumbColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }
}

class _SidebarMenuItem extends StatelessWidget {
  final _MenuItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const _SidebarMenuItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          child: AnimatedContainer(
            duration: AppConstants.animationMedium,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryBlue.withValues(alpha: isDark ? 0.2 : 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            ),
            child: Row(
              children: [
                Icon(
                  isSelected ? item.activeIcon : item.icon,
                  color: isSelected
                      ? AppColors.primaryBlue
                      : (isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight),
                  size: 22,
                ),
                const SizedBox(width: 16),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? AppColors.primaryBlue
                        : (isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  _MenuItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

class GlassDrawer extends StatelessWidget {
  final Widget child;
  final int selectedIndex;
  final ValueChanged<int> onItemTap;
  final ValueChanged<bool> onThemeChanged;
  final bool isDark;

  const GlassDrawer({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.onItemTap,
    required this.onThemeChanged,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
          GlassSidebar(
            selectedIndex: selectedIndex,
            onItemTap: (index) {
              onItemTap(index);
              Navigator.pop(context);
            },
            onThemeChanged: onThemeChanged,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}
