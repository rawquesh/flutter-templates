import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_chip.dart';

class HealthTipsScreen extends StatefulWidget {
  final bool isDark;

  const HealthTipsScreen({super.key, required this.isDark});

  @override
  State<HealthTipsScreen> createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  int _selectedCategory = 0;
  final Set<String> _bookmarkedTips = {};

  static final List<_HealthTip> _tips = [
    _HealthTip(category: 'Diet', title: 'The Power of Superfoods', subtitle: 'Discover foods that boost your immunity and energy levels naturally', readingTime: '5 min'),
    _HealthTip(category: 'Exercise', title: 'Morning Stretching Routine', subtitle: 'Start your day with simple stretches for better flexibility', readingTime: '4 min'),
    _HealthTip(category: 'Sleep', title: 'Sleep Hygiene Essentials', subtitle: 'Tips for improving your sleep quality and establishing healthy habits', readingTime: '6 min'),
    _HealthTip(category: 'Mental Health', title: 'Managing Stress at Work', subtitle: 'Practical techniques to stay calm and productive during busy days', readingTime: '7 min'),
    _HealthTip(category: 'Diet', title: 'Hydration: Why Water Matters', subtitle: 'Understanding the importance of staying hydrated throughout the day', readingTime: '3 min'),
    _HealthTip(category: 'Exercise', title: 'Walking for Better Health', subtitle: 'How a simple daily walk can transform your overall well-being', readingTime: '4 min'),
  ];

  static final List<String> _categories = ['All', 'Diet', 'Exercise', 'Sleep', 'Mental Health'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        floating: true,
        backgroundColor: widget.isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        title: Text('Health Tips', style: TextStyle(color: widget.isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: Icon(Icons.bookmark_outline, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight), onPressed: () {})],
      ),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildCategories(), const SizedBox(height: 24), _buildTipsList(), const SizedBox(height: 100),
      ]))),
    ]);
  }

  Widget _buildCategories() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 12),
      SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(
        children: _categories.asMap().entries.map((e) => Padding(padding: const EdgeInsets.only(right: 8), child: GlassChip(label: e.value, isSelected: _selectedCategory == e.key, icon: _getCategoryIcon(e.value), onTap: () => setState(() => _selectedCategory = e.key)))).toList(),
      )),
    ]).animate().fadeIn(duration: 400.ms);
  }

  IconData _getCategoryIcon(String c) {
    switch (c) { case 'Diet': return Icons.restaurant; case 'Exercise': return Icons.fitness_center; case 'Sleep': return Icons.bedtime; case 'Mental Health': return Icons.psychology; default: return Icons.lightbulb; }
  }

  Widget _buildTipsList() {
    final filtered = _selectedCategory == 0 ? _tips : _tips.where((t) => t.category == _categories[_selectedCategory]).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('${filtered.length} Tips Available', style: TextStyle(fontSize: 16, color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
      const SizedBox(height: 16),
      ...filtered.map((tip) => Padding(padding: const EdgeInsets.only(bottom: 16), child: _TipCard(tip: tip, isDark: widget.isDark, isBookmarked: _bookmarkedTips.contains(tip.title), onBookmark: () => setState(() {
        if (_bookmarkedTips.contains(tip.title)) { _bookmarkedTips.remove(tip.title); } else { _bookmarkedTips.add(tip.title); }
      }))).animate().fadeIn(duration: 400.ms)),
    ]);
  }
}

class _HealthTip { final String category, title, subtitle, readingTime; _HealthTip({required this.category, required this.title, required this.subtitle, required this.readingTime}); }

class _TipCard extends StatelessWidget {
  final _HealthTip tip;
  final bool isDark, isBookmarked;
  final VoidCallback? onBookmark;
  const _TipCard({required this.tip, required this.isDark, this.isBookmarked = false, this.onBookmark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      onTap: () {},
      child: Row(children: [
        Container(width: 80, height: 80, decoration: BoxDecoration(gradient: LinearGradient(colors: _getCategoryColors(tip.category), begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(12)), child: Icon(_getCategoryIcon(tip.category), color: Colors.white, size: 36)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: _getCategoryColors(tip.category)[0].withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)), child: Text(tip.category, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: _getCategoryColors(tip.category)[0]))),
          const SizedBox(height: 8),
          Text(tip.title, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(tip.subtitle, style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(children: [
            Icon(Icons.access_time, size: 14, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
            const SizedBox(width: 4),
            Text(tip.readingTime, style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          ]),
        ])),
        const SizedBox(width: 8),
        GestureDetector(onTap: onBookmark, child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: isBookmarked ? AppColors.primaryBlue : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight))),
      ]),
    );
  }

  IconData _getCategoryIcon(String c) {
    switch (c) { case 'Diet': return Icons.restaurant; case 'Exercise': return Icons.fitness_center; case 'Sleep': return Icons.bedtime; case 'Mental Health': return Icons.psychology; default: return Icons.lightbulb; }
  }

  List<Color> _getCategoryColors(String c) {
    switch (c) { case 'Diet': return [AppColors.success, const Color(0xFF81C784)]; case 'Exercise': return [AppColors.warning, const Color(0xFFFFB74D)]; case 'Sleep': return [AppColors.bloodPressure, const Color(0xFF7E57C2)]; case 'Mental Health': return [AppColors.teal, const Color(0xFF4DD0E1)]; default: return [AppColors.primaryBlue, AppColors.teal]; }
  }
}
