import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/glass_chip.dart';
import '../../theme/app_theme.dart';

class HealthTipsScreen extends StatefulWidget {
  const HealthTipsScreen({super.key});

  @override
  State<HealthTipsScreen> createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  bool _isDark = true;
  int _selectedCategory = 0;
  final Set<String> _bookmarkedTips = {};

  final List<_HealthTip> _tips = [
    _HealthTip(category: 'Diet', title: 'The Power of Superfoods', subtitle: 'Discover foods that boost your immunity and energy levels naturally', readingTime: '5 min'),
    _HealthTip(category: 'Exercise', title: 'Morning Stretching Routine', subtitle: 'Start your day with these simple stretches for better flexibility', readingTime: '4 min'),
    _HealthTip(category: 'Sleep', title: 'Sleep Hygiene Essentials', subtitle: 'Tips for improving your sleep quality and establishing healthy habits', readingTime: '6 min'),
    _HealthTip(category: 'Mental Health', title: 'Managing Stress at Work', subtitle: 'Practical techniques to stay calm and productive during busy days', readingTime: '7 min'),
    _HealthTip(category: 'Diet', title: 'Hydration: Why Water Matters', subtitle: 'Understanding the importance of staying hydrated throughout the day', readingTime: '3 min'),
    _HealthTip(category: 'Exercise', title: 'Walking for Better Health', subtitle: 'How a simple daily walk can transform your overall well-being', readingTime: '4 min'),
    _HealthTip(category: 'Sleep', title: 'Understanding Sleep Cycles', subtitle: 'Learn about REM and non-REM sleep and their importance', readingTime: '5 min'),
    _HealthTip(category: 'Mental Health', title: 'Mindfulness for Beginners', subtitle: 'A gentle introduction to mindfulness meditation practices', readingTime: '8 min'),
  ];

  final List<String> _categories = ['All', 'Diet', 'Exercise', 'Sleep', 'Mental Health'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 5,
              onItemTap: (_) {},
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCategories(),
                        const SizedBox(height: 24),
                        _buildTipsList(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: 0,
        onTap: (_) {},
        items: const [
          GlassBottomNavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
          GlassBottomNavItem(icon: Icons.medical_services_outlined, activeIcon: Icons.medical_services, label: 'Doctors'),
          GlassBottomNavItem(icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today, label: 'Appointments'),
          GlassBottomNavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return GlassDrawer(
      selectedIndex: 5,
      onItemTap: (_) {},
      onThemeToggle: () => setState(() => _isDark = !_isDark),
      currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
      isDark: _isDark,
      child: const SizedBox(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        'Health Tips',
        style: TextStyle(
          color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.bookmark_outline, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
          onPressed: () {},
        ),
        GlassThemeToggle(
          currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
          onChanged: (mode) => setState(() => _isDark = mode == AppThemeMode.dark),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GlassChip(
                  label: category,
                  isSelected: _selectedCategory == index,
                  icon: _getCategoryIcon(category),
                  onTap: () => setState(() => _selectedCategory = index),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Diet':
        return Icons.restaurant;
      case 'Exercise':
        return Icons.fitness_center;
      case 'Sleep':
        return Icons.bedtime;
      case 'Mental Health':
        return Icons.psychology;
      default:
        return Icons.lightbulb;
    }
  }

  Widget _buildTipsList() {
    final filteredTips = _selectedCategory == 0
        ? _tips
        : _tips.where((t) => t.category == _categories[_selectedCategory]).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${filteredTips.length} Tips Available',
          style: TextStyle(fontSize: 16, color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
        ),
        const SizedBox(height: 16),
        ...filteredTips.asMap().entries.map((entry) {
          final index = entry.key;
          final tip = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _TipCard(tip: tip, isDark: _isDark, isBookmarked: _bookmarkedTips.contains(tip.title), onBookmark: () {
              setState(() {
                if (_bookmarkedTips.contains(tip.title)) {
                  _bookmarkedTips.remove(tip.title);
                } else {
                  _bookmarkedTips.add(tip.title);
                }
              });
            }),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
        }),
      ],
    );
  }
}

class _HealthTip {
  final String category;
  final String title;
  final String subtitle;
  final String readingTime;

  _HealthTip({required this.category, required this.title, required this.subtitle, required this.readingTime});
}

class _TipCard extends StatelessWidget {
  final _HealthTip tip;
  final bool isDark;
  final bool isBookmarked;
  final VoidCallback? onBookmark;

  const _TipCard({required this.tip, required this.isDark, this.isBookmarked = false, this.onBookmark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _getCategoryColors(tip.category),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_getCategoryIcon(tip.category), color: Colors.white, size: 36),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCategoryColors(tip.category)[0].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tip.category,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: _getCategoryColors(tip.category)[0]),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tip.title,
                  style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  tip.subtitle,
                  style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                    const SizedBox(width: 4),
                    Text(tip.readingTime, style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                    const Spacer(),
                    Text('Read More', style: TextStyle(fontSize: 12, color: AppColors.primaryBlue, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, size: 14, color: AppColors.primaryBlue),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onBookmark,
            child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: isBookmarked ? AppColors.primaryBlue : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Diet':
        return Icons.restaurant;
      case 'Exercise':
        return Icons.fitness_center;
      case 'Sleep':
        return Icons.bedtime;
      case 'Mental Health':
        return Icons.psychology;
      default:
        return Icons.lightbulb;
    }
  }

  List<Color> _getCategoryColors(String category) {
    switch (category) {
      case 'Diet':
        return [AppColors.success, Color(0xFF81C784)];
      case 'Exercise':
        return [AppColors.warning, Color(0xFFFFB74D)];
      case 'Sleep':
        return [AppColors.bloodPressure, Color(0xFF7E57C2)];
      case 'Mental Health':
        return [AppColors.teal, Color(0xFF4DD0E1)];
      default:
        return [AppColors.primaryBlue, AppColors.teal];
    }
  }
}
