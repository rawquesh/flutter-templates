import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassBadge extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final IconData? icon;

  const GlassBadge({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final badgeColor = color ?? AppColors.primaryOrange;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: badgeColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: textColor ?? badgeColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor ?? badgeColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class StreakBadge extends StatelessWidget {
  final int streakDays;
  final bool showFire;
  final double size;

  const StreakBadge({
    super.key,
    required this.streakDays,
    this.showFire = true,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryOrange.withValues(alpha: 0.2),
            AppColors.primaryRedOrange.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryOrange.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showFire) ...[
            Icon(
              Icons.local_fire_department,
              color: AppColors.primaryOrange,
              size: size / 2,
            ),
            const SizedBox(height: 4),
          ],
          Text(
            '$streakDays',
            style: const TextStyle(
              color: AppColors.primaryOrange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'days',
            style: TextStyle(
              color: AppColors.primaryOrange.withValues(alpha: 0.7),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class LevelBadge extends StatelessWidget {
  final int level;
  final double size;
  final bool showBorder;

  const LevelBadge({
    super.key,
    required this.level,
    this.size = 40,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
        border: showBorder
            ? Border.all(
                color: Colors.white,
                width: 2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$level',
          style: TextStyle(
            color: Colors.white,
            fontSize: size / 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class XpBadge extends StatelessWidget {
  final int currentXp;
  final int targetXp;
  final double width;

  const XpBadge({
    super.key,
    required this.currentXp,
    required this.targetXp,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentXp / targetXp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'XP',
              style: TextStyle(
                color: AppColors.accentBlue,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$currentXp / $targetXp',
              style: const TextStyle(
                color: AppColors.accentBlue,
                fontSize: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 6,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.accentBlue.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.accentBlue,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
