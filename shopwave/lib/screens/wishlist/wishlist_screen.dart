import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/product_card.dart';
import '../../utils/constants.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final favoriteProducts = MockData.products.where((p) => p['isFavorite'] == true).toList();

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: Text('My Wishlist (${favoriteProducts.length})'),
        actions: [
          if (favoriteProducts.isNotEmpty)
            TextButton(
              onPressed: () {},
              child: const Text('Clear All'),
            ),
        ],
      ),
      body: favoriteProducts.isEmpty
          ? _buildEmptyState(context)
          : _buildWishlistContent(context, favoriteProducts),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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
                color: AppColors.accentCoral.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 80,
                color: AppColors.accentCoral.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No favorites yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Save your favorite products here',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text('Start Shopping'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWishlistContent(BuildContext context, List<Map<String, dynamic>> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          name: product['name'],
          brand: product['brand'],
          price: product['price'],
          originalPrice: product['originalPrice'],
          discount: product['discount'],
          rating: product['rating'],
          reviews: product['reviews'],
          isFavorite: true,
        );
      },
    );
  }
}
