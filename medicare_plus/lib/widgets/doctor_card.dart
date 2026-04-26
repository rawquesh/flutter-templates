
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';
import 'glass_card.dart';
import 'glass_button.dart';
import 'glass_avatar.dart';
import 'glass_badge.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final int experienceYears;
  final String? imageUrl;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onBookTap;
  final VoidCallback? onFavoriteTap;
  final bool isDark;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    this.reviewCount = 0,
    this.experienceYears = 0,
    this.imageUrl,
    this.isFavorite = false,
    this.onTap,
    this.onBookTap,
    this.onFavoriteTap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassAvatar(
                  size: 60,
                  name: name,
                  imageUrl: imageUrl,
                  showGlow: true,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. $name',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        specialty,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: AppColors.warning,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating.toStringAsFixed(1),
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '($reviewCount)',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.error : null,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                GlassBadge(
                  label: '$experienceYears years',
                  type: GlassBadgeType.info,
                  isSmall: true,
                  icon: Icons.work_outline,
                ),
                const Spacer(),
                SizedBox(
                  width: 100,
                  child: GlassButton(
                    text: 'Book',
                    variant: GlassButtonVariant.primary,
                    height: 36,
                    onPressed: onBookTap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCardCompact extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final String? imageUrl;
  final VoidCallback? onTap;
  final bool isDark;

  const DoctorCardCompact({
    super.key,
    required this.name,
    required this.specialty,
    required this.rating,
    this.imageUrl,
    this.onTap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : AppColors.dividerLight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlassAvatar(
              size: 50,
              name: name,
              imageUrl: imageUrl,
            ),
            const SizedBox(height: 8),
            Text(
              'Dr. $name',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              specialty,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.primaryBlue,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 14,
                  color: AppColors.warning,
                ),
                const SizedBox(width: 4),
                Text(
                  rating.toStringAsFixed(1),
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
