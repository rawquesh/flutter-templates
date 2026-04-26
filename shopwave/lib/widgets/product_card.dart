import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'glass_badge.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String brand;
  final double price;
  final double? originalPrice;
  final int? discount;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onAddToCart;
  final List<Color>? colors;

  const ProductCard({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    this.originalPrice,
    this.discount,
    required this.rating,
    required this.reviews,
    this.isFavorite = false,
    this.onTap,
    this.onFavorite,
    this.onAddToCart,
    this.colors,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _favoriteController;
  late Animation<double> _favoriteAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _favoriteController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _favoriteAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _favoriteController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }

  void _handleFavorite() {
    _favoriteController.forward().then((_) => _favoriteController.reverse());
    widget.onFavorite?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.grey.withValues(alpha: 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryBlue.withValues(alpha: 0.1),
                              AppColors.accentCoral.withValues(alpha: 0.1),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 48,
                            color: AppColors.primaryBlue.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                      if (widget.discount != null && widget.discount! > 0)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: GlassSaleBadge(discount: widget.discount!),
                        ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: ScaleTransition(
                          scale: _favoriteAnimation,
                          child: GestureDetector(
                            onTap: _handleFavorite,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.black.withValues(alpha: 0.3)
                                    : Colors.white.withValues(alpha: 0.9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                widget.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 20,
                                color: widget.isFavorite
                                    ? AppColors.accentCoral
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.brand,
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ...List.generate(5, (index) {
                              final starIndex = index + 1;
                              if (widget.rating >= starIndex) {
                                return const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: AppColors.warning,
                                );
                              } else if (widget.rating >= starIndex - 0.5) {
                                return const Icon(
                                  Icons.star_half,
                                  size: 14,
                                  color: AppColors.warning,
                                );
                              } else {
                                return const Icon(
                                  Icons.star_border,
                                  size: 14,
                                  color: AppColors.warning,
                                );
                              }
                            }),
                            const SizedBox(width: 4),
                            Text(
                              '(${widget.reviews})',
                              style: TextStyle(
                                fontSize: 11,
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${widget.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: widget.discount != null
                                    ? AppColors.accentCoral
                                    : AppColors.primaryBlue,
                              ),
                            ),
                            if (widget.originalPrice != null) ...[
                              const SizedBox(width: 8),
                              Text(
                                '\$${widget.originalPrice!.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ],
                        ),
                        if (widget.colors != null && widget.colors!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: widget.colors!.map((color) {
                              return Container(
                                width: 16,
                                height: 16,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.withValues(alpha: 0.3),
                                    width: 1,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCardCompact extends StatelessWidget {
  final String name;
  final String brand;
  final double price;
  final double? originalPrice;
  final int? discount;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  const ProductCardCompact({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    this.originalPrice,
    this.discount,
    this.isFavorite = false,
    this.onTap,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryBlue.withValues(alpha: 0.1),
                        AppColors.accentCoral.withValues(alpha: 0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 40,
                      color: AppColors.primaryBlue.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                if (discount != null && discount! > 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: GlassSaleBadge(discount: discount!, fontSize: 10),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavorite,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.black.withValues(alpha: 0.3)
                            : Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: isFavorite ? AppColors.accentCoral : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: discount != null
                          ? AppColors.accentCoral
                          : AppColors.primaryBlue,
                    ),
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
