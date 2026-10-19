import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/water_progress_ring.dart';
import '../../widgets/measurement_chart.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  int _glassesConsumed = 5;
  final int _totalGlasses = 8;

  final List<Map<String, dynamic>> _drinkTypes = [
    {'name': 'Water', 'factor': 1.0, 'icon': Icons.water_drop},
    {'name': 'Sparkling', 'factor': 0.9, 'icon': Icons.bubble_chart},
    {'name': 'Juice', 'factor': 0.8, 'icon': Icons.local_drink},
    {'name': 'Tea', 'factor': 0.95, 'icon': Icons.emoji_food_beverage},
    {'name': 'Coffee', 'factor': 0.8, 'icon': Icons.coffee},
    {'name': 'Sports', 'factor': 1.1, 'icon': Icons.sports_soccer},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5F7),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(isDark)),
            SliverToBoxAdapter(child: _buildProgressRing(isDark)),
            SliverToBoxAdapter(child: _buildQuickAdd(isDark)),
            SliverToBoxAdapter(child: _buildDrinkTypes(isDark)),
            SliverToBoxAdapter(child: _buildHydrationStats(isDark)),
            SliverToBoxAdapter(child: _buildWeeklyOverview(isDark)),
            SliverToBoxAdapter(child: _buildBenefitsInfo(isDark)),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hydration',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Stay hydrated throughout the day',
                style: TextStyle(
                  color: isDark ? Colors.white60 : Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.water_drop, color: AppColors.progressWater),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildProgressRing(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.progressWater.withValues(alpha: 0.3),
            AppColors.accentBlue.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.progressWater.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          WaterProgressRing(
            glassesConsumed: _glassesConsumed,
            totalGlasses: _totalGlasses,
            size: 180,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Today', '${_glassesConsumed * 250}ml'),
              Container(width: 1, height: 30, color: Colors.white.withValues(alpha: 0.2)),
              _buildStatItem('Goal', '${_totalGlasses * 250}ml'),
              Container(width: 1, height: 30, color: Colors.white.withValues(alpha: 0.2)),
              _buildStatItem('Remaining', '${(_totalGlasses - _glassesConsumed) * 250}ml'),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildQuickAdd(bool isDark) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Add',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuickAddWaterButton(
                ml: 250,
                label: 'Small',
                onTap: () => _addWater(250),
              ),
              QuickAddWaterButton(
                ml: 350,
                label: 'Medium',
                onTap: () => _addWater(350),
              ),
              QuickAddWaterButton(
                ml: 500,
                label: 'Large',
                onTap: () => _addWater(500),
              ),
              _buildCustomButton(isDark),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildCustomButton(bool isDark) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.progressWater.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.progressWater.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.edit, color: AppColors.progressWater, size: 24),
            const SizedBox(height: 4),
            Text(
              'Custom',
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addWater(int ml) {
    if (_glassesConsumed >= _totalGlasses) return;
    final glassesToAdd =
        (ml / 250).round().clamp(1, _totalGlasses - _glassesConsumed);
    setState(() => _glassesConsumed += glassesToAdd);
  }

  Widget _buildDrinkTypes(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Drink Types',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _drinkTypes.map((drink) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(drink['icon'] as IconData, color: AppColors.progressWater, size: 18),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drink['name'] as String,
                          style: TextStyle(
                            color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'x${drink['factor']}',
                          style: TextStyle(
                            color: isDark ? Colors.white54 : Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }

  Widget _buildHydrationStats(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hydration Stats',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHydrationStatItem('Today', '${_glassesConsumed * 250}ml', AppColors.progressWater, isDark),
              _buildHydrationStatItem('Average', '1,750ml', AppColors.accentBlue, isDark),
              _buildHydrationStatItem('Best Streak', '12 days', AppColors.success, isDark),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }

  Widget _buildHydrationStatItem(String label, String value, Color color, bool isDark) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.water_drop, color: color, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF1A1A2E),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isDark ? Colors.white54 : Colors.grey,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyOverview(bool isDark) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly Overview',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.progressWater.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Goal: 2000ml',
                  style: TextStyle(color: AppColors.progressWater, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: WeeklyBarChart(
              values: const [1800, 2000, 1600, 2200, 1900, 2100, 1750],
              labels: const ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
              goal: 2000,
              barColor: AppColors.progressWater,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms, duration: 600.ms);
  }

  Widget _buildBenefitsInfo(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.accentBlue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentBlue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.accentBlue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.lightbulb, color: AppColors.accentBlue, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Why Hydration Matters',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '• Improves energy levels and brain function\n• Helps maintain body temperature\n• Supports digestion and nutrient absorption\n• Promotes healthy skin\n• Aids in weight management',
            style: TextStyle(
              color: isDark ? Colors.white70 : Colors.grey.shade700,
              fontSize: 13,
              height: 1.6,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms, duration: 600.ms);
  }
}
