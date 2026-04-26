import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_text_field.dart';
import '../../widgets/product_card.dart';
import '../../widgets/banner_carousel.dart';
import '../../widgets/category_card.dart';
import '../../widgets/deal_card.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final int currentThemeIndex;
  final ValueChanged<int>? onThemeChangedWithIndex;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.currentThemeIndex,
    this.onThemeChangedWithIndex,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showSearch = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: _showSearch ? _buildSearchOverlay() : _buildHomeContent(),
      ),
    );
  }

  Widget _buildHomeContent() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: isDark ? AppColors.sidebarDark : AppColors.cardLight,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.gradientPrimary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 8),
              const Text(
                'ShopWave',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => setState(() => _showSearch = true),
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {},
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.accentCoral,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            _buildThemeToggle(),
            const SizedBox(width: 8),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBannerCarousel(),
                const SizedBox(height: 24),
                _buildFlashSaleSection(),
                const SizedBox(height: 24),
                _buildCategoriesRow(),
                const SizedBox(height: 24),
                _buildFeaturedProducts(),
                const SizedBox(height: 24),
                _buildNewArrivals(),
                const SizedBox(height: 24),
                _buildPopularBrands(),
                const SizedBox(height: 24),
                _buildHomeTreats(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThemeToggle() {
    return PopupMenuButton<int>(
      onSelected: (index) {
        widget.onThemeChangedWithIndex?.call(index);
      },
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => [
        _buildThemeItem(0, 'Light Theme', Icons.wb_sunny),
        _buildThemeItem(1, 'Dark Sidebar', Icons.nights_stay),
        _buildThemeItem(2, 'Dark Theme', Icons.dark_mode),
      ],
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(_getThemeIcon(widget.currentThemeIndex), size: 20),
      ),
    );
  }

  PopupMenuItem<int> _buildThemeItem(int index, String label, IconData icon) {
    final isSelected = index == widget.currentThemeIndex;
    return PopupMenuItem<int>(
      value: index,
      child: Row(
        children: [
          Icon(icon, size: 20, color: isSelected ? AppColors.primaryBlue : null),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryBlue : null,
              fontWeight: isSelected ? FontWeight.w600 : null,
            ),
          ),
          if (isSelected) ...[
            const Spacer(),
            Icon(Icons.check, size: 18, color: AppColors.primaryBlue),
          ],
        ],
      ),
    );
  }

  IconData _getThemeIcon(int index) {
    switch (index) {
      case 0: return Icons.wb_sunny;
      case 1: return Icons.nights_stay;
      case 2: return Icons.dark_mode;
      default: return Icons.nights_stay;
    }
  }

  Widget _buildSearchOverlay() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => setState(() => _showSearch = false),
                  ),
                  Expanded(
                    child: GlassSearchField(
                      controller: _searchController,
                      hintText: 'Search products...',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Recent Searches',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Clear All'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: AppConstants.recentSearches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(AppConstants.recentSearches[index]),
                    trailing: const Icon(Icons.north_west, size: 16),
                    onTap: () {
                      _searchController.text = AppConstants.recentSearches[index];
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return BannerCarousel(
      banners: defaultBanners,
      height: 180,
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildFlashSaleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlashSaleHeader(
          timeRemaining: const Duration(hours: 5, minutes: 32, seconds: 45),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: MockData.flashDeals.length,
            itemBuilder: (context, index) {
              final deal = MockData.flashDeals[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 12,
                  right: index == MockData.flashDeals.length - 1 ? 0 : 0,
                ),
                child: DealCard(
                  name: deal['name'],
                  price: deal['price'],
                  originalPrice: deal['originalPrice'],
                  discount: deal['discount'],
                  soldPercentage: deal['soldPercentage'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.categoryNames.length,
            itemBuilder: (context, index) {
              final icons = [
                Icons.checkroom, Icons.devices, Icons.home, Icons.sports,
                Icons.spa, Icons.book, Icons.toys, Icons.restaurant,
                Icons.pets, Icons.directions_car,
              ];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 12,
                  right: index == AppConstants.categoryNames.length - 1 ? 0 : 0,
                ),
                child: CategoryCardSmall(
                  name: AppConstants.categoryNames[index],
                  icon: icons[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Products',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            final product = MockData.products[index];
            return ProductCard(
              name: product['name'],
              brand: product['brand'],
              price: product['price'],
              originalPrice: product['originalPrice'],
              discount: product['discount'],
              rating: product['rating'],
              reviews: product['reviews'],
              isFavorite: product['isFavorite'],
            );
          },
        ),
      ],
    );
  }

  Widget _buildNewArrivals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Arrivals',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: MockData.products.length,
            itemBuilder: (context, index) {
              final product = MockData.products[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 12,
                  right: index == MockData.products.length - 1 ? 0 : 0,
                ),
                child: ProductCardCompact(
                  name: product['name'],
                  brand: product['brand'],
                  price: product['price'],
                  isFavorite: product['isFavorite'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularBrands() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Brands',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.brands.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 12,
                  right: index == AppConstants.brands.length - 1 ? 0 : 0,
                ),
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppConstants.brands[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHomeTreats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Home Treats',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildTreatCard(
                'Free Shipping',
                'On orders over \$50',
                Icons.local_shipping,
                AppColors.success,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTreatCard(
                '24/7 Support',
                'Always here for you',
                Icons.support_agent,
                AppColors.primaryBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildTreatCard(
                'Secure Payment',
                '100% protected',
                Icons.lock,
                AppColors.warning,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTreatCard(
                'Easy Returns',
                '30-day policy',
                Icons.autorenew,
                AppColors.accentCoral,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTreatCard(String title, String subtitle, IconData icon, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.1),
            color.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
