import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/restaurant_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = AppConstants.recentSearches;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        title: _buildSearchField(isDark),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primaryOrange,
            unselectedLabelColor: isDark ? Colors.white54 : Colors.black54,
            indicatorColor: AppColors.primaryOrange,
            tabs: const [
              Tab(text: 'Restaurants'),
              Tab(text: 'Dishes'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRestaurantResults(isDark),
                _buildDishResults(isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(bool isDark) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Search restaurants or dishes',
          hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.black38),
          prefixIcon: Icon(Icons.search, color: isDark ? Colors.white54 : Colors.black54),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onChanged: (value) => setState(() {}),
      ),
    );
  }

  Widget _buildRestaurantResults(bool isDark) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_searchController.text.isEmpty) ...[
          _buildSectionTitle('Recent Searches', isDark),
          const SizedBox(height: 12),
          ...List.generate(_recentSearches.length, (index) {
            final search = _recentSearches[index];
            return _buildRecentSearchItem(search, isDark);
          }),
          const SizedBox(height: 24),
          _buildSectionTitle('Popular Searches', isDark),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: AppConstants.popularSearches.map((search) {
              return GestureDetector(
                onTap: () {
                  _searchController.text = search;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    search,
                    style: TextStyle(
                      color: isDark ? Colors.white : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ] else ...[
          GridView.builder(
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
              );
            },
          ),
        ],
      ],
    );
  }

  Widget _buildDishResults(bool isDark) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: AppConstants.pizzaPalaceMenu.length,
          itemBuilder: (context, index) {
            final item = AppConstants.pizzaPalaceMenu[index];
            return Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.cardDark : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: item.imageGradient),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Center(
                      child: Icon(Icons.fastfood, color: Colors.white.withValues(alpha: 0.7), size: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: isDark ? Colors.white : AppColors.textPrimaryLight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : AppColors.textPrimaryLight,
      ),
    );
  }

  Widget _buildRecentSearchItem(String search, bool isDark) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.history, color: isDark ? Colors.white54 : Colors.black54),
      title: Text(
        search,
        style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimaryLight),
      ),
      trailing: IconButton(
        icon: Icon(Icons.close, size: 18, color: isDark ? Colors.white38 : Colors.black38),
        onPressed: () {},
      ),
      onTap: () {
        _searchController.text = search;
        setState(() {});
      },
    );
  }
}
