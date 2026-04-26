import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/deal_card.dart';
import '../../widgets/glass_chip.dart';
import '../../utils/constants.dart';

class FlashDealsScreen extends StatefulWidget {
  const FlashDealsScreen({super.key});

  @override
  State<FlashDealsScreen> createState() => _FlashDealsScreenState();
}

class _FlashDealsScreenState extends State<FlashDealsScreen> {
  int _selectedCategory = 0;
  late Duration _timeRemaining;

  final List<String> _categories = [
    'All Deals',
    'Electronics',
    'Fashion',
    'Home',
    'Beauty',
    'Sports',
  ];

  @override
  void initState() {
    super.initState();
    _timeRemaining = const Duration(hours: 5, minutes: 32, seconds: 45);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Flash Deals'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTimerHeader(),
          _buildCategoryChips(),
          Expanded(
            child: _buildDealsGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerHeader() {
    final hours = _timeRemaining.inHours;
    final minutes = _timeRemaining.inMinutes % 60;
    final seconds = _timeRemaining.inSeconds % 60;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.gradientAccent,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentCoral.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.bolt, color: Colors.white, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deal ends in',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTimeBox(hours ~/ 10),
                    _buildTimeBox(hours % 10),
                    _buildTimeSeparator(),
                    _buildTimeBox(minutes ~/ 10),
                    _buildTimeBox(minutes % 10),
                    _buildTimeSeparator(),
                    _buildTimeBox(seconds ~/ 10),
                    _buildTimeBox(seconds % 10),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.local_fire_department, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text(
                  'Hot Deals',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(int value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$value',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTimeSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ':',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GlassFilterChip(
              label: _categories[index],
              isSelected: _selectedCategory == index,
              onTap: () => setState(() => _selectedCategory = index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDealsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: MockData.flashDeals.length,
      itemBuilder: (context, index) {
        final deal = MockData.flashDeals[index];
        return DealCard(
          name: deal['name'],
          price: deal['price'],
          originalPrice: deal['originalPrice'],
          discount: deal['discount'],
          soldPercentage: deal['soldPercentage'],
        );
      },
    );
  }
}
