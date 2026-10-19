import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_progress_ring.dart';
import '../../widgets/glass_avatar.dart';
import '../../widgets/streak_calendar.dart';
import '../../widgets/workout_card.dart';
import '../workouts/workouts_screen.dart';
import '../workouts/workout_detail_screen.dart';
import '../profile/profile_screen.dart';
import '../progress/progress_screen.dart';
import '../exercises/exercises_screen.dart';
import '../diet/diet_screen.dart';
import '../challenges/challenges_screen.dart';
import '../water_tracker/water_tracker_screen.dart';
import '../meal_planner/meal_planner_screen.dart';
import '../body_measurements/body_measurements_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(ThemeMode)? onThemeChanged;

  const HomeScreen({super.key, this.onThemeChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  List<Widget> get _screens => [
    _buildDashboard(),
    const WorkoutsScreen(),
    const ExercisesScreen(),
    const ProgressScreen(),
    ProfileScreen(onThemeChanged: widget.onThemeChanged),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5F7),
      body: IndexedStack(
        index: _currentNavIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildDashboard() {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildTodaysProgress()),
          SliverToBoxAdapter(child: _buildQuickStart()),
          SliverToBoxAdapter(child: _buildWeeklyStreak()),
          SliverToBoxAdapter(child: _buildTodaysWorkout()),
          SliverToBoxAdapter(child: _buildRecentActivity()),
          SliverToBoxAdapter(child: _buildMoreFeatures()),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GlassAvatar(
            placeholderText: 'JD',
            size: 50,
            showLevelRing: true,
            level: 12,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildTodaysProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Progress",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedProgressRing(
                value: 0.65,
                label: 'Calories',
                valueText: '1,234 / 2,000',
                color: AppColors.progressCalories,
                size: 70,
              ),
              AnimatedProgressRing(
                value: 0.45,
                label: 'Duration',
                valueText: '45 / 90 min',
                color: AppColors.progressSteps,
                size: 70,
              ),
              AnimatedProgressRing(
                value: 0.80,
                label: 'Steps',
                valueText: '8,234',
                color: AppColors.accentBlue,
                size: 70,
              ),
              AnimatedProgressRing(
                value: 0.50,
                label: 'Water',
                valueText: '4 / 8 gl',
                color: AppColors.progressWater,
                size: 70,
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildQuickStart() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ready to workout?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Start your daily workout routine',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryOrange,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Start Workout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms).slideY(begin: 0.1);
  }

  Widget _buildWeeklyStreak() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StreakCalendar(
        weekDays: [true, true, true, true, false, false, false],
        currentStreak: 4,
        currentDayIndex: 3,
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }

  Widget _buildTodaysWorkout() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Workout",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color(0xFF1A1A2E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() => _currentNavIndex = 1);
                },
                child: const Text(
                  'See All',
                  style: TextStyle(color: AppColors.primaryOrange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          WorkoutCard(
            name: 'Full Body HIIT',
            type: 'HIIT',
            duration: '30 min',
            difficulty: 4,
            calories: '350',
            exerciseCount: 12,
            isFavorite: true,
            showFeatured: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WorkoutDetailScreen(
                    workoutName: 'Full Body HIIT',
                    workoutType: 'HIIT',
                    duration: '30 min',
                    difficulty: 4,
                    calories: '350',
                    exerciseCount: 12,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms, duration: 600.ms);
  }

  Widget _buildRecentActivity() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildActivityItem(
            icon: Icons.fitness_center,
            title: 'Upper Body Strength',
            subtitle: 'Completed • 45 min',
            time: '2 hours ago',
            color: AppColors.primaryOrange,
          ),
          _buildActivityItem(
            icon: Icons.directions_run,
            title: 'Morning Run',
            subtitle: 'Completed • 5.2 km',
            time: 'Yesterday',
            color: AppColors.accentBlue,
          ),
          _buildActivityItem(
            icon: Icons.self_improvement,
            title: 'Yoga Session',
            subtitle: 'Completed • 30 min',
            time: '2 days ago',
            color: AppColors.success,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms, duration: 600.ms);
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
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
                    color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDark ? Colors.white60 : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: isDark ? Colors.white38 : Colors.grey.shade400,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreFeatures() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final features = [
      {
        'icon': Icons.restaurant_menu,
        'label': 'Diet',
        'color': AppColors.success,
        'screen': const DietScreen(),
      },
      {
        'icon': Icons.emoji_events,
        'label': 'Challenges',
        'color': AppColors.primaryOrange,
        'screen': const ChallengesScreen(),
      },
      {
        'icon': Icons.water_drop,
        'label': 'Water Tracker',
        'color': AppColors.progressWater,
        'screen': const WaterTrackerScreen(),
      },
      {
        'icon': Icons.calendar_month,
        'label': 'Meal Planner',
        'color': AppColors.accentBlue,
        'screen': const MealPlannerScreen(),
      },
      {
        'icon': Icons.straighten,
        'label': 'Measurements',
        'color': AppColors.progressSteps,
        'screen': const BodyMeasurementsScreen(),
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'More Features',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemCount: features.length,
            itemBuilder: (context, index) {
              final feature = features[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => feature['screen'] as Widget,
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.05)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : Colors.grey.shade200,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: (feature['color'] as Color)
                              .withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          feature['icon'] as IconData,
                          color: feature['color'] as Color,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        feature['label'] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF1A1A2E),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn(delay: 700.ms, duration: 600.ms);
  }

  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF1A1A2E).withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.grey.shade200,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, Icons.home, 'Home', 0),
                _buildNavItem(Icons.fitness_center, Icons.fitness_center, 'Workouts', 1),
                _buildNavItem(Icons.sports_gymnastics, Icons.sports_gymnastics, 'Exercises', 2),
                _buildNavItem(Icons.bar_chart, Icons.bar_chart, 'Progress', 3),
                _buildNavItem(Icons.person, Icons.person, 'Profile', 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, IconData activeIcon, String label, int index) {
    final isSelected = _currentNavIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => setState(() => _currentNavIndex = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryOrange.withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isSelected ? activeIcon : icon,
                color: isSelected
                    ? AppColors.primaryOrange
                    : (isDark ? Colors.white54 : Colors.grey),
                size: 22,
              ),
            ),
            const SizedBox(height: 2),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryOrange
                    : (isDark ? Colors.white54 : Colors.grey),
                fontSize: 9,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
