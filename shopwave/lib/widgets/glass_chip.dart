import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;

  const GlassChip({
    super.key,
    required this.label,
    this.icon,
    this.isSelected = false,
    this.onTap,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isSelected
        ? (selectedColor ?? AppColors.primaryBlue)
        : (isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.white.withValues(alpha: 0.8));
    final textColor = isSelected
        ? Colors.white
        : (isDark ? Colors.white : AppColors.textPrimaryLight);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : (isDark
                    ? Colors.white.withValues(alpha: 0.2)
                    : Colors.grey.withValues(alpha: 0.3)),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: (selectedColor ?? AppColors.primaryBlue)
                        .withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: textColor),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassCategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const GlassCategoryChip({
    super.key,
    required this.label,
    required this.icon,
    this.isSelected = false,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? AppColors.primaryBlue;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [color, color.withValues(alpha: 0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withValues(alpha: isSelected ? 0 : 0.3),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : color,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? icon;

  const GlassFilterChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue
              : (isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.grey.withValues(alpha: 0.1)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryBlue
                : (isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.grey.withValues(alpha: 0.3)),
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
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.grey[600]),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.grey[700]),
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Icon(
                Icons.close,
                size: 14,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
