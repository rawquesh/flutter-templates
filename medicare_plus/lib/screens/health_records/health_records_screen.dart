import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../theme/app_theme.dart';

class HealthRecordsScreen extends StatefulWidget {
  const HealthRecordsScreen({super.key});

  @override
  State<HealthRecordsScreen> createState() => _HealthRecordsScreenState();
}

class _HealthRecordsScreenState extends State<HealthRecordsScreen> with SingleTickerProviderStateMixin {
  bool _isDark = true;
  late TabController _tabController;

  final List<_HealthRecord> _records = [
    _HealthRecord(type: RecordType.report, title: 'Complete Blood Count', date: DateTime(2026, 4, 15), doctor: 'Dr. Emily Parker'),
    _HealthRecord(type: RecordType.report, title: 'Chest X-Ray', date: DateTime(2026, 3, 20), doctor: 'Dr. Sarah Wilson'),
    _HealthRecord(type: RecordType.prescription, title: 'Blood Pressure Medication', date: DateTime(2026, 4, 10), doctor: 'Dr. Sarah Wilson'),
    _HealthRecord(type: RecordType.vaccination, title: 'COVID-19 Booster', date: DateTime(2026, 2, 15), doctor: 'Dr. Lisa Thompson'),
    _HealthRecord(type: RecordType.history, title: 'Annual Physical Examination', date: DateTime(2026, 1, 10), doctor: 'Dr. Emily Parker'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 3,
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
                      _buildRecordList(RecordType.report),
                      _buildRecordList(RecordType.prescription),
                      _buildRecordList(RecordType.vaccination),
                      _buildRecordList(RecordType.history),
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
      selectedIndex: 3,
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
        'Health Records',
        style: TextStyle(
          color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.upload_file, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
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

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTabChip('Reports', Icons.description, 0),
            const SizedBox(width: 8),
            _buildTabChip('Prescriptions', Icons.medication, 1),
            const SizedBox(width: 8),
            _buildTabChip('Vaccinations', Icons.vaccines, 2),
            const SizedBox(width: 8),
            _buildTabChip('History', Icons.history, 3),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildTabChip(String label, IconData icon, int index) {
    final isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () => _tabController.animateTo(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : (_isDark ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : (_isDark ? Colors.white.withOpacity(0.1) : AppColors.dividerLight),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSelected ? Colors.white : (_isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : (_isDark ? Colors.white : AppColors.textPrimaryLight),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordList(RecordType type) {
    final filteredRecords = _records.where((r) => r.type == type).toList();

    if (filteredRecords.isEmpty) {
      return _buildEmptyState(type);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredRecords.length,
      itemBuilder: (context, index) {
        final record = filteredRecords[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _RecordCard(record: record, isDark: _isDark),
        ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
      },
    );
  }

  Widget _buildEmptyState(RecordType type) {
    String title;
    String message;
    IconData icon;

    switch (type) {
      case RecordType.report:
        title = 'No Reports';
        message = 'Your medical reports will appear here';
        icon = Icons.description_outlined;
        break;
      case RecordType.prescription:
        title = 'No Prescriptions';
        message = 'Your prescriptions will appear here';
        icon = Icons.medication_outlined;
        break;
      case RecordType.vaccination:
        title = 'No Vaccinations';
        message = 'Your vaccination records will appear here';
        icon = Icons.vaccines_outlined;
        break;
      case RecordType.history:
        title = 'No History';
        message = 'Your medical history will appear here';
        icon = Icons.history;
        break;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
          const SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
          const SizedBox(height: 8),
          Text(message, style: TextStyle(color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}

enum RecordType { report, prescription, vaccination, history }

class _HealthRecord {
  final RecordType type;
  final String title;
  final DateTime date;
  final String doctor;

  _HealthRecord({required this.type, required this.title, required this.date, required this.doctor});
}

class _RecordCard extends StatelessWidget {
  final _HealthRecord record;
  final bool isDark;

  const _RecordCard({required this.record, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getIconColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_getIcon(), color: _getIconColor(), size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.title,
                      style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.doctor,
                      style: TextStyle(fontSize: 12, color: AppColors.primaryBlue),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.download, color: AppColors.primaryBlue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share, color: AppColors.teal),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              const SizedBox(width: 4),
              Text(
                _formatDate(record.date),
                style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIcon() {
    switch (record.type) {
      case RecordType.report:
        return Icons.description;
      case RecordType.prescription:
        return Icons.medication;
      case RecordType.vaccination:
        return Icons.vaccines;
      case RecordType.history:
        return Icons.history;
    }
  }

  Color _getIconColor() {
    switch (record.type) {
      case RecordType.report:
        return AppColors.primaryBlue;
      case RecordType.prescription:
        return AppColors.warning;
      case RecordType.vaccination:
        return AppColors.success;
      case RecordType.history:
        return AppColors.teal;
    }
  }

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}
