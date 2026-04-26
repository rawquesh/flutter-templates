import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/constants.dart';

class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerLoading({
    super.key,
    this.width = double.infinity,
    this.height = 20,
    this.borderRadius = AppConstants.radiusSmall,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const ShimmerCard({
    super.key,
    this.width,
    this.height,
    this.borderRadius = AppConstants.radiusMedium,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      width: width ?? double.infinity,
      height: height ?? 120,
      borderRadius: borderRadius,
    );
  }
}

class ShimmerDoctorCard extends StatelessWidget {
  const ShimmerDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 12,
                    width: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 12,
                    width: 60,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerAppointmentCard extends StatelessWidget {
  const ShimmerAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14,
                        width: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 12,
                        width: 70,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  height: 12,
                  width: 80,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Container(
                  height: 12,
                  width: 60,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  final int itemCount;
  final double itemHeight;

  const ShimmerList({
    super.key,
    this.itemCount = 5,
    this.itemHeight = 80,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ShimmerLoading(
            height: itemHeight,
            borderRadius: AppConstants.radiusMedium,
          ),
        );
      },
    );
  }
}

class ShimmerGrid extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double itemHeight;

  const ShimmerGrid({
    super.key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.itemHeight = 150,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ShimmerCard(
          height: itemHeight,
          borderRadius: AppConstants.radiusMedium,
        );
      },
    );
  }
}
