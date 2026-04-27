import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum BadgeType { veg, nonVeg, bestseller, popular, offer, newItem, rating }

class GlassBadge extends StatelessWidget {
  final String text;
  final BadgeType type;
  final double fontSize;

  const GlassBadge({
    super.key,
    required this.text,
    required this.type,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(4),
        border: _getBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (type == BadgeType.veg || type == BadgeType.nonVeg) ...[
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: type == BadgeType.veg
                    ? AppColors.vegGreen
                    : AppColors.nonVegRed,
                borderRadius: BorderRadius.circular(2),
              ),
              child: type == BadgeType.veg
                  ? const Icon(
                      Icons.circle,
                      size: 6,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: _getTextColor(),
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case BadgeType.veg:
        return AppColors.vegGreen.withValues(alpha: 0.15);
      case BadgeType.nonVeg:
        return AppColors.nonVegRed.withValues(alpha: 0.15);
      case BadgeType.bestseller:
        return AppColors.warningYellow.withValues(alpha: 0.2);
      case BadgeType.popular:
        return AppColors.accentRed.withValues(alpha: 0.15);
      case BadgeType.offer:
        return AppColors.successGreen.withValues(alpha: 0.15);
      case BadgeType.newItem:
        return AppColors.primaryOrange.withValues(alpha: 0.15);
      case BadgeType.rating:
        return AppColors.warningYellow.withValues(alpha: 0.2);
    }
  }

  Color _getTextColor() {
    switch (type) {
      case BadgeType.veg:
        return AppColors.vegGreen;
      case BadgeType.nonVeg:
        return AppColors.nonVegRed;
      case BadgeType.bestseller:
        return const Color(0xFFE65100);
      case BadgeType.popular:
        return AppColors.accentRed;
      case BadgeType.offer:
        return AppColors.successGreen;
      case BadgeType.newItem:
        return AppColors.primaryOrange;
      case BadgeType.rating:
        return const Color(0xFFE65100);
    }
  }

  Border? _getBorder() {
    switch (type) {
      case BadgeType.veg:
        return Border.all(color: AppColors.vegGreen, width: 1);
      case BadgeType.nonVeg:
        return Border.all(color: AppColors.nonVegRed, width: 1);
      default:
        return null;
    }
  }
}
