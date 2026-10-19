
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';

class GlassChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? selectedColor;

  const GlassChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.icon,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final activeColor = selectedColor ?? AppColors.primaryBlue;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.animationMedium,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? activeColor.withValues(alpha: isDark ? 0.2 : 0.15)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.white.withValues(alpha: 0.6)),
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          border: Border.all(
            color: isSelected
                ? activeColor
                : (isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : AppColors.dividerLight),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: isSelected
                    ? activeColor
                    : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? activeColor
                    : (isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassFilterChips extends StatelessWidget {
  final List<GlassFilterChipData> chips;
  final int? selectedIndex;
  final ValueChanged<int>? onTap;
  final bool isScrollable;

  const GlassFilterChips({
    super.key,
    required this.chips,
    this.selectedIndex,
    this.onTap,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final chipWidgets = List.generate(chips.length, (index) {
      final chip = chips[index];
      return GlassChip(
        label: chip.label,
        icon: chip.icon,
        isSelected: selectedIndex == index,
        selectedColor: chip.color,
        onTap: onTap != null ? () => onTap!(index) : null,
      );
    });

    if (isScrollable) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            for (int i = 0; i < chipWidgets.length; i++) ...[
              chipWidgets[i],
              if (i < chipWidgets.length - 1) const SizedBox(width: 8),
            ],
          ],
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: chipWidgets,
    );
  }
}

class GlassFilterChipData {
  final String label;
  final IconData? icon;
  final Color? color;

  const GlassFilterChipData({
    required this.label,
    this.icon,
    this.color,
  });
}
