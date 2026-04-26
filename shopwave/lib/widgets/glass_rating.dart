import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassRating extends StatelessWidget {
  final double rating;
  final int reviews;
  final double size;
  final bool showReviews;
  final ValueChanged<double>? onRatingChanged;

  const GlassRating({
    super.key,
    required this.rating,
    this.reviews = 0,
    this.size = 16,
    this.showReviews = true,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          final starIndex = index + 1;
          IconData icon;

          if (rating >= starIndex) {
            icon = Icons.star;
          } else if (rating >= starIndex - 0.5) {
            icon = Icons.star_half;
          } else {
            icon = Icons.star_border;
          }

          return GestureDetector(
            onTap: onRatingChanged != null
                ? () => onRatingChanged!(starIndex.toDouble())
                : null,
            child: Icon(
              icon,
              size: size,
              color: AppColors.warning,
            ),
          );
        }),
        if (showReviews && reviews > 0) ...[
          const SizedBox(width: 8),
          Text(
            '($reviews)',
            style: TextStyle(
              fontSize: size * 0.8,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ],
    );
  }
}

class GlassRatingBar extends StatelessWidget {
  final int stars;
  final int count;
  final double percentage;

  const GlassRatingBar({
    super.key,
    required this.stars,
    required this.count,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Row(
              children: [
                Text(
                  '$stars',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.star,
                  size: 12,
                  color: AppColors.warning,
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percentage / 100,
                backgroundColor: Colors.grey.withValues(alpha: 0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.warning,
                ),
                minHeight: 8,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 40,
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 12,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
