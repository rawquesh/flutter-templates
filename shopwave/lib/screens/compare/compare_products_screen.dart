import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_badge.dart';

class CompareProductsScreen extends StatefulWidget {
  const CompareProductsScreen({super.key});

  @override
  State<CompareProductsScreen> createState() => _CompareProductsScreenState();
}

class _CompareProductsScreenState extends State<CompareProductsScreen> {
  final List<Map<String, String>> _products = [
    {'name': 'Wireless Headphones Pro', 'price': '\$149.99', 'rating': '4.8', 'reviews': '1.2K', 'brand': 'AudioTech', 'stock': 'In Stock'},
    {'name': 'Premium Earbuds X', 'price': '\$199.99', 'rating': '4.6', 'reviews': '890', 'brand': 'SoundMax', 'stock': 'Low Stock'},
    {'name': 'Studio Headphones', 'price': '\$129.99', 'rating': '4.5', 'reviews': '650', 'brand': 'ProAudio', 'stock': 'In Stock'},
    {'name': 'Budget Buds Plus', 'price': '\$79.99', 'rating': '4.2', 'reviews': '2.1K', 'brand': 'SoundMax', 'stock': 'In Stock'},
  ];

  final List<String> _features = ['Price', 'Rating', 'Reviews', 'Brand', 'Availability', 'Colors', 'Warranty', 'Shipping'];
  int? _bestValueIndex;
  int? _bestRatedIndex;

  @override
  void initState() {
    super.initState();
    _bestValueIndex = 2;
    _bestRatedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Compare Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProductChips(),
          Expanded(
            child: _buildComparisonTable(isDark),
          ),
          _buildAddToCartBar(isDark),
        ],
      ),
    );
  }

  Widget _buildProductChips() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Products to Compare', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Clear All')),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Chip(
                    label: Text(_products[index]['name']!),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Product'),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonTable(bool isDark) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProductHeaders(isDark),
          ..._features.map((feature) => _buildFeatureRow(feature, isDark)),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildProductHeaders(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text('Feature', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSecondaryLight)),
          ),
          ..._products.asMap().entries.map((entry) {
            final index = entry.key;
            final product = entry.value;
            final isBestValue = index == _bestValueIndex;
            final isBestRated = index == _bestRatedIndex;

            return Expanded(
              child: Column(
                children: [
                  if (isBestValue)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GlassBadge(text: 'Best Value', backgroundColor: AppColors.success),
                    ),
                  if (isBestRated)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GlassBadge(text: 'Best Rated', backgroundColor: AppColors.primaryBlue),
                    ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryBlue.withValues(alpha: 0.1),
                          AppColors.accentCoral.withValues(alpha: 0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(Icons.headphones, size: 32, color: AppColors.primaryBlue.withValues(alpha: 0.5)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String feature, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.02) : Colors.grey.withValues(alpha: 0.05),
        border: Border(
          bottom: BorderSide(color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.grey.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              feature,
              style: TextStyle(color: AppColors.textSecondaryLight, fontSize: 13),
            ),
          ),
          ..._products.asMap().entries.map((entry) {
            final index = entry.key;
            final product = entry.value;
            final isBest = (feature == 'Price' && index == _bestValueIndex) ||
                          (feature == 'Rating' && index == _bestRatedIndex);

            String value;
            switch (feature) {
              case 'Price':
                value = product['price']!;
                break;
              case 'Rating':
                value = '${product['rating']} Stars';
                break;
              case 'Reviews':
                value = product['reviews']!;
                break;
              case 'Brand':
                value = product['brand']!;
                break;
              case 'Availability':
                value = product['stock']!;
                break;
              case 'Colors':
                value = '4 Colors';
                break;
              case 'Warranty':
                value = '1 Year';
                break;
              case 'Shipping':
                value = 'Free';
                break;
              default:
                value = '-';
            }

            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: isBest
                    ? BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      )
                    : null,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isBest ? FontWeight.bold : FontWeight.normal,
                    color: isBest ? AppColors.success : null,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAddToCartBar(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: _products.map((product) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    product['price']!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
