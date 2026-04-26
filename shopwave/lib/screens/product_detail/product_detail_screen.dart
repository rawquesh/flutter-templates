import 'dart:ui';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_rating.dart';
import '../../widgets/glass_chip.dart';
import '../../widgets/glass_quantity_selector.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedColor = 0;
  int _selectedSize = 0;
  int _quantity = 1;
  final int _currentImageIndex = 0;
  bool _isFavorite = false;

  final List<Color> _colors = [Colors.black, Colors.white, Colors.blue, Colors.red];
  final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildImageSection(),
              SliverToBoxAdapter(
                child: _buildProductInfo(isDark),
              ),
            ],
          ),
          _buildBottomBar(isDark),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? AppColors.accentCoral : null,
            ),
            onPressed: () => setState(() => _isFavorite = !_isFavorite),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withValues(alpha: 0.1),
                    AppColors.accentCoral.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 150,
                  color: AppColors.primaryBlue.withValues(alpha: 0.3),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: _currentImageIndex == index ? 24 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: _currentImageIndex == index
                          ? AppColors.primaryBlue
                          : Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, size: 16, color: AppColors.success),
                      const SizedBox(width: 4),
                      Text(
                        'Verified Brand',
                        style: TextStyle(
                          color: AppColors.success,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GlassRating(rating: 4.5, reviews: 123),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Premium Wireless Headphones',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'AudioTech Pro',
              style: TextStyle(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '\$149.99',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$199.99',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.accentCoral,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '-25%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildColorSelector(isDark),
            const SizedBox(height: 24),
            _buildSizeSelector(isDark),
            const SizedBox(height: 24),
            _buildQuantitySelector(isDark),
            const SizedBox(height: 24),
            _buildDescription(isDark),
            const SizedBox(height: 24),
            _buildReviewsSection(isDark),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSelector(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(_colors.length, (index) {
            final isSelected = _selectedColor == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedColor = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 44,
                height: 44,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: _colors[index],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primaryBlue : Colors.grey.withValues(alpha: 0.3),
                    width: isSelected ? 3 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primaryBlue.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: _colors[index] == Colors.white ? Colors.black : Colors.white,
                        size: 20,
                      )
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSizeSelector(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Size Guide'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(_sizes.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: index < _sizes.length - 1 ? 12 : 0),
              child: GlassChip(
                label: _sizes[index],
                isSelected: _selectedSize == index,
                onTap: () => setState(() => _selectedSize = index),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quantity',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        GlassQuantitySelector(
          quantity: _quantity,
          onChanged: (value) => setState(() => _quantity = value),
        ),
      ],
    );
  }

  Widget _buildDescription(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Experience premium sound quality with our latest wireless headphones. '
          'Featuring active noise cancellation, 30-hour battery life, and premium comfort padding. '
          'Perfect for music lovers and professionals alike.',
          style: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () {},
          child: const Text('Read more'),
        ),
      ],
    );
  }

  Widget _buildReviewsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reviews (123)',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See all'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  GlassRating(rating: 4.5, reviews: 0, size: 16),
                  const SizedBox(height: 4),
                  Text(
                    '123 reviews',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    GlassRatingBar(stars: 5, count: 89, percentage: 72),
                    GlassRatingBar(stars: 4, count: 22, percentage: 18),
                    GlassRatingBar(stars: 3, count: 8, percentage: 7),
                    GlassRatingBar(stars: 2, count: 3, percentage: 2),
                    GlassRatingBar(stars: 1, count: 1, percentage: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(bool isDark) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.8)
                  : Colors.white.withValues(alpha: 0.9),
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.grey.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? AppColors.accentCoral : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentCoral,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
