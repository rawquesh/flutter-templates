import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/measurement_chart.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final String _selectedPeriod = 'Week';

  final List<ChartDataPoint> _weightData = [
    ChartDataPoint(label: 'Mon', value: 75.5),
    ChartDataPoint(label: 'Tue', value: 75.2),
    ChartDataPoint(label: 'Wed', value: 75.0),
    ChartDataPoint(label: 'Thu', value: 74.8),
    ChartDataPoint(label: 'Fri', value: 74.5),
    ChartDataPoint(label: 'Sat', value: 74.3),
    ChartDataPoint(label: 'Sun', value: 74.0),
  ];

  final List<Map<String, dynamic>> _achievements = [
    {'title': 'First Workout', 'icon': Icons.fitness_center, 'unlocked': true},
    {'title': '7 Day Streak', 'icon': Icons.local_fire_department, 'unlocked': true},
    {'title': '10 Workouts', 'icon': Icons.star, 'unlocked': true},
    {'title': 'Early Bird', 'icon': Icons.wb_sunny, 'unlocked': false},
    {'title': 'Night Owl', 'icon': Icons.nightlight, 'unlocked': false},
    {'title': '50 Workouts', 'icon': Icons.emoji_events, 'unlocked': false},
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
            SliverToBoxAdapter(child: _buildSummaryStats(isDark)),
            SliverToBoxAdapter(child: _buildWeightChart(isDark)),
            SliverToBoxAdapter(child: _buildBodyMeasurements(isDark)),
            SliverToBoxAdapter(child: _buildAchievements(isDark)),
            SliverToBoxAdapter(child: _buildWorkoutCalendar(isDark)),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Progress',
                style: TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Track your fitness journey',
                style: TextStyle(
                  color: subtitleColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.primaryOrange, size: 18),
                const SizedBox(width: 8),
                Text(
                  _selectedPeriod,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildSummaryStats(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('12', 'Workouts', Icons.fitness_center, AppColors.primaryOrange, isDark),
          _buildStatItem('2,450', 'Calories', Icons.local_fire_department, AppColors.progressCalories, isDark),
          _buildStatItem('4', 'Streak', Icons.local_fire_department, AppColors.warning, isDark),
          _buildStatItem('45', 'Avg min', Icons.timer, AppColors.accentBlue, isDark),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildStatItem(String value, String label, IconData icon, Color color, bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: subtitleColor, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildWeightChart(bool isDark) {
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
                'Weight Progress',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_downward, color: AppColors.success, size: 14),
                    SizedBox(width: 4),
                    Text(
                      '-1.5 kg',
                      style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          MeasurementChart(
            data: _weightData,
            title: '',
            lineColor: AppColors.primaryOrange,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildBodyMeasurements(bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);

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
            'Body Measurements',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildMeasurementItem('Chest', '102 cm', Icons.expand, isDark)),
              Expanded(child: _buildMeasurementItem('Waist', '84 cm', Icons.remove, isDark)),
              Expanded(child: _buildMeasurementItem('Hips', '98 cm', Icons.circle_outlined, isDark)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildMeasurementItem('Arms', '38 cm', Icons.pan_tool, isDark)),
              Expanded(child: _buildMeasurementItem('Thighs', '56 cm', Icons.straighten, isDark)),
              Expanded(child: _buildMeasurementItem('Calves', '38 cm', Icons.accessibility, isDark)),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }

  Widget _buildMeasurementItem(String label, String value, IconData icon, bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final subtitleColor = isDark ? Colors.white60 : Colors.grey;

    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryOrange, size: 20),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w600)),
          Text(label, style: TextStyle(color: subtitleColor, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildAchievements(bool isDark) {
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Achievements',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See All', style: TextStyle(color: AppColors.primaryOrange)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _achievements.length,
              itemBuilder: (context, index) {
                final achievement = _achievements[index];
                final unlocked = achievement['unlocked'] as bool;
                final iconColor = unlocked ? AppColors.warning : Colors.grey;
                final cardColor = unlocked ? AppColors.warning.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1);
                final cardBorderColor = unlocked ? AppColors.warning.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.2);

                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? cardColor : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: cardBorderColor),
                    boxShadow: isDark ? null : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: iconColor.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          achievement['icon'],
                          color: iconColor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        achievement['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: unlocked ? textColor : Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }

  Widget _buildWorkoutCalendar(bool isDark) {
    final completedDays = [true, true, false, true, true, true, false];
    final textColor = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final dayColor = isDark ? Colors.white54 : Colors.grey;

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
            'Workout Calendar',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
              final isCompleted = completedDays[index];
              return Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(color: dayColor, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCompleted ? AppColors.primaryOrange : Colors.transparent,
                      border: Border.all(
                        color: isCompleted ? AppColors.primaryOrange : (isDark ? Colors.white24 : Colors.grey.shade300),
                      ),
                    ),
                    child: isCompleted
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms, duration: 600.ms);
  }
}
