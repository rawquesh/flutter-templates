import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/restaurant_card.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/offer_banner.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onRestaurantTap;

  const HomeScreen({super.key, required this.onRestaurantTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context, isDark),
            SliverToBoxAdapter(child: _buildLocationHeader(isDark)),
            SliverToBoxAdapter(child: _buildSearchBar(isDark)),
            SliverToBoxAdapter(child: _buildPromoBanners()),
            SliverToBoxAdapter(child: _buildCategories(isDark)),
            SliverToBoxAdapter(child: _buildSectionHeader('Featured Restaurants', isDark)),
            SliverToBoxAdapter(child: _buildFeaturedRestaurants()),
            SliverToBoxAdapter(child: _buildSectionHeader('Popular Near You', isDark)),
            SliverToBoxAdapter(child: _buildPopularRestaurants()),
            SliverToBoxAdapter(child: _buildSectionHeader('All Restaurants', isDark)),
            SliverToBoxAdapter(child: _buildAllRestaurants()),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return SliverAppBar(
      floating: true,
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      elevation: 0,
      title: Row(
        children: [
          Icon(
            Icons.location_on,
            color: AppColors.primaryOrange,
            size: 24,
          ),
          const SizedBox(width: 8),
          const Text(
            'FoodieGo',
            style: TextStyle(
              color: AppColors.primaryOrange,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            color: isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildLocationHeader(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deliver to',
                style: TextStyle(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Text(
                    '123 Main Street',
                    style: TextStyle(
                      color: isDark ? Colors.white : AppColors.textPrimaryLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primaryOrange,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.access_time, size: 14, color: AppColors.successGreen),
                SizedBox(width: 4),
                Text(
                  'Deliver Now',
                  style: TextStyle(
                    color: AppColors.successGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: isDark ? Colors.white54 : Colors.black54,
            ),
            const SizedBox(width: 12),
            Text(
              'Search restaurants or dishes',
              style: TextStyle(
                color: isDark ? Colors.white38 : Colors.black38,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.mic,
              color: AppColors.primaryOrange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanners() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: AppConstants.promoBanners.length,
        itemBuilder: (context, index) {
          final banner = AppConstants.promoBanners[index];
          return OfferBanner(
            title: banner.title,
            subtitle: banner.subtitle,
            gradient: banner.gradient,
          ).animate().fadeIn(delay: (100 * index).ms).slideX(begin: 0.2);
        },
      ),
    );
  }

  Widget _buildCategories(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: AppConstants.categories.length,
            itemBuilder: (context, index) {
              final category = AppConstants.categories[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CategoryChip(
                  name: category.name,
                  icon: category.icon,
                  color: category.color,
                ),
              ).animate().fadeIn(delay: (50 * index).ms).scale(begin: const Offset(0.8, 0.8));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryOrange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedRestaurants() {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: AppConstants.restaurants.take(5).length,
        itemBuilder: (context, index) {
          final restaurant = AppConstants.restaurants[index];
          return RestaurantCard(
            name: restaurant.name,
            cuisine: restaurant.cuisine,
            rating: restaurant.rating,
            reviewCount: restaurant.reviewCount,
            deliveryTime: restaurant.deliveryTime,
            deliveryFee: restaurant.deliveryFee,
            distance: restaurant.distance,
            imageGradient: restaurant.imageGradient,
            isOpen: restaurant.isOpen,
            onTap: onRestaurantTap,
          ).animate().fadeIn(delay: (100 * index).ms).slideX(begin: 0.2);
        },
      ),
    );
  }

  Widget _buildPopularRestaurants() {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: AppConstants.restaurants.skip(3).take(5).length,
        itemBuilder: (context, index) {
          final restaurant = AppConstants.restaurants.skip(3).toList()[index];
          return RestaurantCard(
            name: restaurant.name,
            cuisine: restaurant.cuisine,
            rating: restaurant.rating,
            reviewCount: restaurant.reviewCount,
            deliveryTime: restaurant.deliveryTime,
            deliveryFee: restaurant.deliveryFee,
            distance: restaurant.distance,
            imageGradient: restaurant.imageGradient,
            isOpen: restaurant.isOpen,
            showFreeDelivery: restaurant.deliveryFee == 0,
            onTap: onRestaurantTap,
          ).animate().fadeIn(delay: (100 * index).ms).slideX(begin: 0.2);
        },
      ),
    );
  }

  Widget _buildAllRestaurants() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: AppConstants.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = AppConstants.restaurants[index];
          return RestaurantGridCard(
            name: restaurant.name,
            cuisine: restaurant.cuisine,
            rating: restaurant.rating,
            reviewCount: restaurant.reviewCount,
            deliveryTime: restaurant.deliveryTime,
            deliveryFee: restaurant.deliveryFee,
            distance: restaurant.distance,
            imageGradient: restaurant.imageGradient,
            isOpen: restaurant.isOpen,
            onTap: onRestaurantTap,
          ).animate().fadeIn(delay: (50 * index).ms);
        },
      ),
    );
  }
}
