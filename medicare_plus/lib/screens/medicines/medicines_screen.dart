import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_badge.dart';

class MedicinesScreen extends StatefulWidget {
  final bool isDark;

  const MedicinesScreen({super.key, required this.isDark});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Set<String> _takenMedicines = {};

  static final List<_Medicine> _allMedicines = [
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
    return Column(
      children: [
        AppBar(
          backgroundColor: widget.isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          title: Text(
            'My Medicines',
            style: TextStyle(
              color: widget.isDark ? Colors.white : AppColors.textPrimaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildTabBar(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildTodayMedicines(), _buildAllMedicines()],
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.isDark ? Colors.white.withValues(alpha: 0.05) : Colors.white,
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
        unselectedLabelColor: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: "Today's Medicines"),
          Tab(text: 'All Medicines'),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildTodayMedicines() {
    final grouped = <MedicineTime, List<_Medicine>>{
      MedicineTime.morning: [],
      MedicineTime.afternoon: [],
      MedicineTime.evening: [],
      MedicineTime.night: [],
    };
    for (final med in _allMedicines) {
      grouped[med.time]!.add(med);
    }
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTimeSection('Morning', MedicineTime.morning, Icons.wb_sunny, AppColors.warning, grouped[MedicineTime.morning]!),
        _buildTimeSection('Afternoon', MedicineTime.afternoon, Icons.wb_cloudy, AppColors.primaryBlue, grouped[MedicineTime.afternoon]!),
        _buildTimeSection('Evening', MedicineTime.evening, Icons.nights_stay, AppColors.teal, grouped[MedicineTime.evening]!),
        _buildTimeSection('Night', MedicineTime.night, Icons.bedtime, AppColors.bloodPressure, grouped[MedicineTime.night]!),
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
              decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: widget.isDark ? Colors.white : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(width: 8),
            GlassBadge(label: '${medicines.length}', type: GlassBadgeType.info, isSmall: true),
          ],
        ),
        const SizedBox(height: 12),
        ...medicines.map((med) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _MedicineCard(
              medicine: med,
              isDark: widget.isDark,
              isTaken: _takenMedicines.contains(med.name),
              onToggle: () {
                setState(() {
                  if (_takenMedicines.contains(med.name)) {
                    _takenMedicines.remove(med.name);
                  } else {
                    _takenMedicines.add(med.name);
                  }
                });
              },
            ),
          ).animate().fadeIn(duration: 400.ms);
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
        final med = _allMedicines[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _MedicineCard(medicine: med, isDark: widget.isDark, showTime: true),
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

  _Medicine({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.instructions,
    required this.time,
  });
}

class _MedicineCard extends StatelessWidget {
  final _Medicine medicine;
  final bool isDark;
  final bool isTaken;
  final VoidCallback? onToggle;
  final bool showTime;

  const _MedicineCard({
    required this.medicine,
    required this.isDark,
    this.isTaken = false,
    this.onToggle,
    this.showTime = false,
  });

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
                border: Border.all(
                  color: isTaken ? AppColors.success : AppColors.primaryBlue,
                  width: 2,
                ),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${medicine.dosage} - ${medicine.frequency}',
                  style: const TextStyle(fontSize: 12, color: AppColors.primaryBlue),
                ),
                const SizedBox(height: 4),
                Text(
                  medicine.instructions,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          if (showTime) GlassBadge(label: _getTimeLabel(medicine.time), type: GlassBadgeType.info, isSmall: true),
        ],
      ),
    );
  }

  String _getTimeLabel(MedicineTime t) {
    switch (t) {
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
