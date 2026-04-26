import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/glass_badge.dart';
import '../../theme/app_theme.dart';

class MedicinesScreen extends StatefulWidget {
  const MedicinesScreen({super.key});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> with SingleTickerProviderStateMixin {
  bool _isDark = true;
  late TabController _tabController;
  final Set<String> _takenMedicines = {};

  final List<_Medicine> _allMedicines = [
    _Medicine(name: 'Lisinopril', dosage: '10mg', frequency: 'Once daily', instructions: 'Take in the morning with food', time: MedicineTime.morning),
    _Medicine(name: 'Metformin', dosage: '500mg', frequency: 'Twice daily', instructions: 'Take after meals', time: MedicineTime.morning),
    _Medicine(name: 'Atorvastatin', dosage: '20mg', frequency: 'Once daily', instructions: 'Take at bedtime', time: MedicineTime.night),
    _Medicine(name: 'Aspirin', dosage: '81mg', frequency: 'Once daily', instructions: 'Take with food', time: MedicineTime.morning),
    _Medicine(name: 'Vitamin D3', dosage: '2000 IU', frequency: 'Once daily', instructions: 'Take with a meal', time: MedicineTime.evening),
    _Medicine(name: 'Omeprazole', dosage: '20mg', frequency: 'Once daily', instructions: 'Take 30 minutes before breakfast', time: MedicineTime.morning),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 4,
              onItemTap: (_) {},
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: Column(
              children: [
                _buildAppBar(),
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildTodayMedicines(),
                      _buildAllMedicines(),
                    ],
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
      selectedIndex: 4,
      onItemTap: (_) {},
      onThemeToggle: () => setState(() => _isDark = !_isDark),
      currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
      isDark: _isDark,
      child: const SizedBox(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        'My Medicines',
        style: TextStyle(
          color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        GlassThemeToggle(
          currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
          onChanged: (mode) => setState(() => _isDark = mode == AppThemeMode.dark),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isDark ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(4),
        labelColor: Colors.white,
        unselectedLabelColor: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: "Today's Medicines"),
          Tab(text: 'All Medicines'),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildTodayMedicines() {
    final groupedByTime = <MedicineTime, List<_Medicine>>{
      MedicineTime.morning: [],
      MedicineTime.afternoon: [],
      MedicineTime.evening: [],
      MedicineTime.night: [],
    };

    for (final medicine in _allMedicines) {
      groupedByTime[medicine.time]!.add(medicine);
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTimeSection('Morning', MedicineTime.morning, Icons.wb_sunny, AppColors.warning, groupedByTime[MedicineTime.morning]!),
        _buildTimeSection('Afternoon', MedicineTime.afternoon, Icons.wb_cloudy, AppColors.primaryBlue, groupedByTime[MedicineTime.afternoon]!),
        _buildTimeSection('Evening', MedicineTime.evening, Icons.nights_stay, AppColors.teal, groupedByTime[MedicineTime.evening]!),
        _buildTimeSection('Night', MedicineTime.night, Icons.bedtime, AppColors.bloodPressure, groupedByTime[MedicineTime.night]!),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildTimeSection(String title, MedicineTime time, IconData icon, Color color, List<_Medicine> medicines) {
    if (medicines.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
            ),
            const SizedBox(width: 8),
            GlassBadge(label: '${medicines.length}', type: GlassBadgeType.info, isSmall: true),
          ],
        ),
        const SizedBox(height: 12),
        ...medicines.asMap().entries.map((entry) {
          final index = entry.key;
          final medicine = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _MedicineCard(medicine: medicine, isDark: _isDark, isTaken: _takenMedicines.contains(medicine.name), onToggle: () {
              setState(() {
                if (_takenMedicines.contains(medicine.name)) {
                  _takenMedicines.remove(medicine.name);
                } else {
                  _takenMedicines.add(medicine.name);
                }
              });
            }),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildAllMedicines() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _allMedicines.length,
      itemBuilder: (context, index) {
        final medicine = _allMedicines[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _MedicineCard(medicine: medicine, isDark: _isDark, showTime: true),
        ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
      },
    );
  }
}

enum MedicineTime { morning, afternoon, evening, night }

class _Medicine {
  final String name;
  final String dosage;
  final String frequency;
  final String instructions;
  final MedicineTime time;

  _Medicine({required this.name, required this.dosage, required this.frequency, required this.instructions, required this.time});
}

class _MedicineCard extends StatelessWidget {
  final _Medicine medicine;
  final bool isDark;
  final bool isTaken;
  final VoidCallback? onToggle;
  final bool showTime;

  const _MedicineCard({required this.medicine, required this.isDark, this.isTaken = false, this.onToggle, this.showTime = false});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isTaken ? AppColors.success : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: isTaken ? AppColors.success : AppColors.primaryBlue, width: 2),
              ),
              child: isTaken ? const Icon(Icons.check, color: Colors.white, size: 18) : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine.name,
                  style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight),
                ),
                const SizedBox(height: 4),
                Text(
                  '${medicine.dosage} - ${medicine.frequency}',
                  style: TextStyle(fontSize: 12, color: AppColors.primaryBlue),
                ),
                const SizedBox(height: 4),
                Text(
                  medicine.instructions,
                  style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                ),
              ],
            ),
          ),
          if (showTime) ...[
            GlassBadge(label: _getTimeLabel(medicine.time), type: GlassBadgeType.info, isSmall: true),
          ],
        ],
      ),
    );
  }

  String _getTimeLabel(MedicineTime time) {
    switch (time) {
      case MedicineTime.morning:
        return 'Morning';
      case MedicineTime.afternoon:
        return 'Afternoon';
      case MedicineTime.evening:
        return 'Evening';
      case MedicineTime.night:
        return 'Night';
    }
  }
}
