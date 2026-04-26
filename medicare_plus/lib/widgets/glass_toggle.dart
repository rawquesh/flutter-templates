import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';
import '../theme/app_theme.dart';

class GlassToggle extends StatelessWidget {
  final int selectedIndex;
  final List<GlassToggleOption> options;
  final ValueChanged<int> onChanged;
  final bool showLabels;

  const GlassToggle({
    super.key,
    required this.selectedIndex,
    required this.options,
    required this.onChanged,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.08)
                : Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : AppColors.dividerLight,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(options.length, (index) {
              final option = options[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => onChanged(index),
                child: AnimatedContainer(
                  duration: AppConstants.animationMedium,
                  padding: EdgeInsets.symmetric(
                    horizontal: showLabels ? 16 : 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryBlue
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColors.primaryBlue.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        option.icon,
                        size: 18,
                        color: isSelected
                            ? Colors.white
                            : (isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight),
                      ),
                      if (showLabels) ...[
                        const SizedBox(width: 8),
                        Text(
                          option.label,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected
                                ? Colors.white
                                : (isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class GlassToggleOption {
  final IconData icon;
  final String label;

  const GlassToggleOption({
    required this.icon,
    required this.label,
  });
}

class GlassThemeToggle extends StatelessWidget {
  final AppThemeMode currentTheme;
  final ValueChanged<AppThemeMode> onChanged;

  const GlassThemeToggle({
    super.key,
    required this.currentTheme,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GlassToggle(
      selectedIndex: currentTheme.index,
      options: const [
        GlassToggleOption(icon: Icons.light_mode, label: 'Light'),
        GlassToggleOption(icon: Icons.view_sidebar, label: 'Hybrid'),
        GlassToggleOption(icon: Icons.dark_mode, label: 'Dark'),
      ],
      onChanged: (index) => onChanged(AppThemeMode.values[index]),
    );
  }
}

class GlassSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final double size;

  const GlassSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = activeColor ?? AppColors.primaryBlue;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: AppConstants.animationMedium,
        width: size,
        height: size * 0.5,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: value
              ? color.withOpacity(0.2)
              : (isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(size * 0.25),
          border: Border.all(
            color: value
                ? color
                : (isDark
                    ? Colors.white.withOpacity(0.2)
                    : AppColors.dividerLight),
          ),
        ),
        child: AnimatedAlign(
          duration: AppConstants.animationMedium,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: size * 0.4,
            height: size * 0.4,
            decoration: BoxDecoration(
              color: value ? color : (isDark ? Colors.white54 : Colors.black54),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (value ? color : Colors.black).withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
