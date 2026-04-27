import 'package:flutter/material.dart';
import '../theme/colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool showValue;
  final Color? color;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showValue = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final starColor = color ?? AppColors.warningYellow;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          final starValue = index + 1;
          IconData icon;

          if (rating >= starValue) {
            icon = Icons.star;
          } else if (rating >= starValue - 0.5) {
            icon = Icons.star_half;
          } else {
            icon = Icons.star_border;
          }

          return Icon(
            icon,
            size: size,
            color: starColor,
          );
        }),
        if (showValue) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              color: starColor,
              fontSize: size * 0.75,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}
