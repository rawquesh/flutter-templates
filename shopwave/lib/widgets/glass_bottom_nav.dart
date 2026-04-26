import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<GlassBottomNavItem> items;

  const GlassBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isSelected = currentIndex == index;

                return GestureDetector(
                  onTap: () => onTap(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? const LinearGradient(
                                        colors: AppColors.gradientPrimary,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                isSelected ? item.activeIcon : item.icon,
                                color: isSelected
                                    ? Colors.white
                                    : (isDark
                                        ? Colors.white70
                                        : Colors.grey[600]),
                                size: 24,
                              ),
                            ),
                            if (item.badgeCount != null && item.badgeCount! > 0)
                              Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentCoral,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: Text(
                                    item.badgeCount! > 99
                                        ? '99+'
                                        : '${item.badgeCount}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.normal,
                            color: isSelected
                                ? AppColors.primaryBlue
                                : (isDark ? Colors.white70 : Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassBottomNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int? badgeCount;

  const GlassBottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.badgeCount,
  });
}
