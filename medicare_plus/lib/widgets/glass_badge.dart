import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';

class GlassBadge extends StatelessWidget {
  final String label;
  final GlassBadgeType type;
  final bool isSmall;
  final IconData? icon;

  const GlassBadge({
    super.key,
    required this.label,
    this.type = GlassBadgeType.neutral,
    this.isSmall = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final config = _getBadgeConfig();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 12,
        vertical: isSmall ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: config.borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: isSmall ? 12 : 14,
              color: config.textColor,
            ),
            SizedBox(width: isSmall ? 4 : 6),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: isSmall ? 10 : 12,
              fontWeight: FontWeight.w600,
              color: config.textColor,
            ),
          ),
        ],
      ),
    );
  }

  _BadgeConfig _getBadgeConfig() {
    switch (type) {
      case GlassBadgeType.success:
        return _BadgeConfig(
          backgroundColor: AppColors.success.withOpacity(0.15),
          borderColor: AppColors.success.withOpacity(0.3),
          textColor: AppColors.success,
        );
      case GlassBadgeType.warning:
        return _BadgeConfig(
          backgroundColor: AppColors.warning.withOpacity(0.15),
          borderColor: AppColors.warning.withOpacity(0.3),
          textColor: AppColors.warning,
        );
      case GlassBadgeType.error:
        return _BadgeConfig(
          backgroundColor: AppColors.error.withOpacity(0.15),
          borderColor: AppColors.error.withOpacity(0.3),
          textColor: AppColors.error,
        );
      case GlassBadgeType.info:
        return _BadgeConfig(
          backgroundColor: AppColors.primaryBlue.withOpacity(0.15),
          borderColor: AppColors.primaryBlue.withOpacity(0.3),
          textColor: AppColors.primaryBlue,
        );
      case GlassBadgeType.emergency:
        return _BadgeConfig(
          backgroundColor: AppColors.emergency.withOpacity(0.15),
          borderColor: AppColors.emergency.withOpacity(0.3),
          textColor: AppColors.emergency,
        );
      case GlassBadgeType.neutral:
        return _BadgeConfig(
          backgroundColor: Colors.grey.withOpacity(0.15),
          borderColor: Colors.grey.withOpacity(0.3),
          textColor: Colors.grey,
        );
    }
  }
}

enum GlassBadgeType {
  success,
  warning,
  error,
  info,
  emergency,
  neutral,
}

class _BadgeConfig {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  _BadgeConfig({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  });
}

class GlassNotificationBadge extends StatelessWidget {
  final int count;
  final bool showZero;
  final Color? color;

  const GlassNotificationBadge({
    super.key,
    required this.count,
    this.showZero = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (count == 0 && !showZero) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      constraints: const BoxConstraints(minWidth: 18),
      decoration: BoxDecoration(
        color: color ?? AppColors.error,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Center(
        child: Text(
          count > 99 ? '99+' : count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GlassStatusIndicator extends StatelessWidget {
  final bool isOnline;
  final double size;

  const GlassStatusIndicator({
    super.key,
    required this.isOnline,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isOnline ? AppColors.success : Colors.grey,
        border: Border.all(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 2,
        ),
        boxShadow: isOnline
            ? [
                BoxShadow(
                  color: AppColors.success.withOpacity(0.4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
    );
  }
}
