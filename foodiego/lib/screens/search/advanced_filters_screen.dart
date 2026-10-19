import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_button.dart';

class AdvancedFiltersScreen extends StatefulWidget {
  const AdvancedFiltersScreen({super.key});

  @override
  State<AdvancedFiltersScreen> createState() => _AdvancedFiltersScreenState();
}

class _AdvancedFiltersScreenState extends State<AdvancedFiltersScreen> {
  final Set<String> _selectedCuisines = {};
  final Set<String> _selectedDietary = {};
  final Set<String> _selectedPromos = {};
  String _priceRange = '';
  double _distance = 5.0;
  double _minRating = 3.0;
  String _sortBy = 'Recommended';

  final List<String> _cuisines = [
    'American', 'Italian', 'Chinese', 'Japanese', 'Mexican',
    'Indian', 'Thai', 'Mediterranean', 'Fast Food', 'Healthy', 'Desserts',
  ];

  final List<String> _dietary = [
    'Vegetarian', 'Vegan', 'Gluten-Free', 'Halal', 'Kosher', 'Dairy-Free', 'Nut-Free',
  ];

  final List<String> _priceRanges = ['\$', '\$\$', '\$\$\$', '\$\$\$\$'];
  final List<String> _sortOptions = [
    'Recommended', 'Rating', 'Delivery Time', 'Price: Low to High', 'Price: High to Low', 'Distance',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => setState(() {
              _selectedCuisines.clear();
              _selectedDietary.clear();
              _priceRange = '';
              _distance = 5.0;
              _minRating = 3.0;
              _sortBy = 'Recommended';
            }),
            child: const Text('Reset'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Sort By', isDark),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _sortOptions.map((option) {
                final isSelected = _sortBy == option;
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: AppColors.primaryOrange.withValues(alpha: 0.2),
                  onSelected: (s) => setState(() => _sortBy = option),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Cuisine', isDark),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _cuisines.map((cuisine) {
                final isSelected = _selectedCuisines.contains(cuisine);
                return FilterChip(
                  label: Text(cuisine),
                  selected: isSelected,
                  selectedColor: AppColors.primaryOrange.withValues(alpha: 0.2),
                  checkmarkColor: AppColors.primaryOrange,
                  onSelected: (s) {
                    setState(() {
                      if (s) {
                        _selectedCuisines.add(cuisine);
                      } else {
                        _selectedCuisines.remove(cuisine);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Dietary Preferences', isDark),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _dietary.map((diet) {
                final isSelected = _selectedDietary.contains(diet);
                return FilterChip(
                  label: Text(diet),
                  selected: isSelected,
                  selectedColor: AppColors.successGreen.withValues(alpha: 0.2),
                  checkmarkColor: AppColors.successGreen,
                  onSelected: (s) {
                    setState(() {
                      if (s) {
                        _selectedDietary.add(diet);
                      } else {
                        _selectedDietary.remove(diet);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Price Range', isDark),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: _priceRanges.map((range) {
                final isSelected = _priceRange == range;
                return GestureDetector(
                  onTap: () => setState(() => _priceRange = isSelected ? '' : range),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryOrange.withValues(alpha: 0.2)
                          : (isDark ? AppColors.cardDark : Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(color: AppColors.primaryOrange)
                          : null,
                    ),
                    child: Text(
                      range,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.primaryOrange
                            : (isDark ? Colors.white : AppColors.textPrimaryLight),
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Distance', isDark),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _distance,
                    min: 1,
                    max: 20,
                    divisions: 19,
                    activeColor: AppColors.primaryOrange,
                    onChanged: (v) => setState(() => _distance = v),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_distance.toInt()} km',
                    style: const TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Minimum Rating', isDark),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _minRating,
                    min: 3.0,
                    max: 5.0,
                    divisions: 8,
                    activeColor: AppColors.warningYellow,
                    onChanged: (v) => setState(() => _minRating = v),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.warningYellow.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 16, color: AppColors.warningYellow),
                      const SizedBox(width: 4),
                      Text(
                        _minRating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: AppColors.warningYellow,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Promotions', isDark),
            const SizedBox(height: 12),
            _buildPromoOption('Free Delivery', Icons.local_shipping, isDark),
            _buildPromoOption('Buy 1 Get 1 Free', Icons.card_giftcard, isDark),
            _buildPromoOption('Cashback', Icons.money, isDark),
            _buildPromoOption('Restaurant Open Now', Icons.access_time, isDark),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: _buildApplyButton(isDark),
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

  Widget _buildPromoOption(String title, IconData icon, bool isDark) {
    final isSelected = _selectedPromos.contains(title);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryOrange),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          const Spacer(),
          Switch(
            value: isSelected,
            onChanged: (v) {
              setState(() {
                if (v) {
                  _selectedPromos.add(title);
                } else {
                  _selectedPromos.remove(title);
                }
              });
            },
            activeTrackColor: AppColors.primaryOrange.withValues(alpha: 0.5),
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primaryOrange;
              }
              return Colors.grey;
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Text(
              'XX restaurants match',
              style: TextStyle(
                color: isDark ? Colors.white70 : AppColors.textSecondaryLight,
              ),
            ),
            const Spacer(),
            GlassButton(
              text: 'Apply Filters',
              width: 160,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
