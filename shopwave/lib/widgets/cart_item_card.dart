import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'glass_quantity_selector.dart';

class CartItemCard extends StatelessWidget {
  final String name;
  final String variant;
  final double price;
  final int quantity;
  final ValueChanged<int>? onQuantityChanged;
  final VoidCallback? onRemove;
  final VoidCallback? onMoveToWishlist;

  const CartItemCard({
    super.key,
    required this.name,
    required this.variant,
    required this.price,
    required this.quantity,
    this.onQuantityChanged,
    this.onRemove,
    this.onMoveToWishlist,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
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
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryBlue.withValues(alpha: 0.1),
                      AppColors.accentCoral.withValues(alpha: 0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 32,
                    color: AppColors.primaryBlue.withValues(alpha: 0.5),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
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
                              const SizedBox(height: 4),
                              Text(
                                variant,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: onRemove,
                          icon: Icon(
                            Icons.close,
                            size: 20,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        GlassQuantitySelector(
                          quantity: quantity,
                          onChanged: onQuantityChanged ?? (_) {},
                        ),
                      ],
                    ),
                    if (onMoveToWishlist != null) ...[
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: onMoveToWishlist,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 14,
                              color: AppColors.accentCoral,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Move to Wishlist',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.accentCoral,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyCartState extends StatelessWidget {
  final VoidCallback? onStartShopping;

  const EmptyCartState({
    super.key,
    this.onStartShopping,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.05)
                    : AppColors.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 80,
                color: AppColors.primaryBlue.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Looks like you haven\'t added anything to your cart yet',
              style: TextStyle(
                fontSize: 14,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onStartShopping,
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text('Start Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}
