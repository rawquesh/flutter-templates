import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WorkoutCard extends StatelessWidget {
  final String name;
  final String type;
  final String duration;
  final int difficulty;
  final String calories;
  final int exerciseCount;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final bool showFeatured;

  const WorkoutCard({
    super.key,
    required this.name,
    required this.type,
    required this.duration,
    required this.difficulty,
    required this.calories,
    required this.exerciseCount,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
    this.showFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: showFeatured ? AppColors.primaryGradient : null,
          color: showFeatured
              ? null
              : (isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.white),
          boxShadow: showFeatured
              ? [
                  BoxShadow(
                    color: AppColors.primaryOrange.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: showFeatured
                      ? Colors.white.withValues(alpha: 0.3)
                      : (isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.grey.shade200),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: showFeatured
                              ? Colors.white.withValues(alpha: 0.2)
                              : AppColors.primaryOrange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.fitness_center,
                          color: showFeatured ? Colors.white : AppColors.primaryOrange,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: showFeatured
                                    ? Colors.white
                                    : (isDark ? Colors.white : const Color(0xFF1A1A2E)),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: showFeatured
                                    ? Colors.white.withValues(alpha: 0.2)
                                    : AppColors.primaryOrange.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: showFeatured
                                      ? Colors.white
                                      : AppColors.primaryOrange,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (onFavoriteToggle != null)
                        IconButton(
                          onPressed: onFavoriteToggle,
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red
                                : (showFeatured ? Colors.white70 : Colors.grey),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoChip(
                        icon: Icons.timer,
                        label: duration,
                        showFeatured: showFeatured,
                      ),
                      _buildInfoChip(
                        icon: Icons.local_fire_department,
                        label: '$calories cal',
                        showFeatured: showFeatured,
                      ),
                      _buildInfoChip(
                        icon: Icons.fitness_center,
                        label: '$exerciseCount exercises',
                        showFeatured: showFeatured,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'Difficulty: ',
                        style: TextStyle(
                          color: showFeatured ? Colors.white70 : (isDark ? Colors.white60 : Colors.grey),
                          fontSize: 12,
                        ),
                      ),
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 16,
                          color: index < difficulty
                              ? (showFeatured ? Colors.white : AppColors.warning)
                              : (showFeatured ? Colors.white24 : Colors.grey.shade300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required bool showFeatured,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: showFeatured ? Colors.white70 : Colors.grey,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: showFeatured ? Colors.white70 : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
