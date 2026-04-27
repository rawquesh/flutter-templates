import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/review_card.dart';

class RestaurantReviewsScreen extends StatefulWidget {
  const RestaurantReviewsScreen({super.key});

  @override
  State<RestaurantReviewsScreen> createState() => _RestaurantReviewsScreenState();
}

class _RestaurantReviewsScreenState extends State<RestaurantReviewsScreen> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _reviews = [
    {'name': 'Sarah M.', 'date': 'Mar 15, 2024', 'rating': 5.0, 'review': 'Amazing pizza! The crust was perfectly crispy and the toppings were fresh. Will definitely order again!', 'verified': true, 'helpful': 12},
    {'name': 'John D.', 'date': 'Mar 12, 2024', 'rating': 4.0, 'review': 'Great taste, but delivery took a bit longer than expected. Food was still warm when it arrived.', 'verified': true, 'helpful': 8},
    {'name': 'Emily R.', 'date': 'Mar 10, 2024', 'rating': 4.5, 'review': 'Best pizza in town! Love their Margherita. The cheese is always perfectly melted.', 'verified': true, 'helpful': 15},
    {'name': 'Mike T.', 'date': 'Mar 8, 2024', 'rating': 3.5, 'review': 'Good food but portions could be bigger for the price. Otherwise, tasty.', 'verified': false, 'helpful': 3},
    {'name': 'Lisa K.', 'date': 'Mar 5, 2024', 'rating': 5.0, 'review': 'Absolutely fantastic! Ordered for a party and everyone loved it. Highly recommend!', 'verified': true, 'helpful': 22},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRatingSummary(isDark),
            _buildFilters(isDark),
            _buildReviewList(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSummary(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
      ),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                '4.5',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.warningYellow,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_half,
                    color: AppColors.warningYellow,
                    size: 20,
                  );
                }),
              ),
              const SizedBox(height: 4),
              Text(
                '234 reviews',
                style: TextStyle(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: RatingBreakdown(
              ratings: {5: 120, 4: 68, 3: 28, 2: 12, 1: 6},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(bool isDark) {
    final filters = ['All', 'With Photos', 'Positive', 'Critical'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: filters.map((filter) {
            final isSelected = _selectedFilter == filter;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => setState(() => _selectedFilter = filter),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryOrange.withValues(alpha: 0.2)
                        : (isDark ? AppColors.cardDark : Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(20),
                    border: isSelected ? Border.all(color: AppColors.primaryOrange) : null,
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.primaryOrange
                          : (isDark ? Colors.white : AppColors.textPrimaryLight),
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildReviewList(bool isDark) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        final review = _reviews[index];
        return ReviewCard(
          userName: review['name'],
          date: review['date'],
          rating: review['rating'],
          review: review['review'],
          isVerified: review['verified'],
          helpfulCount: review['helpful'],
        );
      },
    );
  }
}
