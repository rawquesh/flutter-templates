import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';

class HealthRecordsScreen extends StatefulWidget {
  final bool isDark;

  const HealthRecordsScreen({super.key, required this.isDark});

  @override
  State<HealthRecordsScreen> createState() => _HealthRecordsScreenState();
}

class _HealthRecordsScreenState extends State<HealthRecordsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static final List<_HealthRecord> _records = [
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
    return Column(
      children: [
        AppBar(
          backgroundColor: widget.isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          title: Text('Health Records', style: TextStyle(color: widget.isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
          actions: [IconButton(icon: Icon(Icons.upload_file, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight), onPressed: () {})],
        ),
        _buildTabBar(),
        Expanded(child: TabBarView(
          controller: _tabController,
          children: [
            _buildRecordList(RecordType.report),
            _buildRecordList(RecordType.prescription),
            _buildRecordList(RecordType.vaccination),
            _buildRecordList(RecordType.history),
          ],
        )),
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
          color: isSelected ? AppColors.primaryBlue : (widget.isDark ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primaryBlue : (widget.isDark ? Colors.white.withOpacity(0.1) : AppColors.dividerLight)),
        ),
        child: Row(children: [
          Icon(icon, size: 18, color: isSelected ? Colors.white : (widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: isSelected ? Colors.white : (widget.isDark ? Colors.white : AppColors.textPrimaryLight), fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400)),
        ]),
      ),
    );
  }

  Widget _buildRecordList(RecordType type) {
    final filtered = _records.where((r) => r.type == type).toList();
    if (filtered.isEmpty) return Center(child: Text('No records', style: TextStyle(color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)));
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final record = filtered[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _RecordCard(record: record, isDark: widget.isDark),
        ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
      },
    );
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
          Row(children: [
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: _getColor().withOpacity(0.2), borderRadius: BorderRadius.circular(12)), child: Icon(_getIcon(), color: _getColor(), size: 24)),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(record.title, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
              const SizedBox(height: 4),
              Text(record.doctor, style: const TextStyle(fontSize: 12, color: AppColors.primaryBlue)),
            ])),
            IconButton(icon: const Icon(Icons.download, color: AppColors.primaryBlue), onPressed: () {}),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Icon(Icons.calendar_today, size: 14, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
            const SizedBox(width: 4),
            Text(_formatDate(record.date), style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
          ]),
        ],
      ),
    );
  }

  IconData _getIcon() {
    switch (record.type) {
      case RecordType.report: return Icons.description;
      case RecordType.prescription: return Icons.medication;
      case RecordType.vaccination: return Icons.vaccines;
      case RecordType.history: return Icons.history;
    }
  }

  Color _getColor() {
    switch (record.type) {
      case RecordType.report: return AppColors.primaryBlue;
      case RecordType.prescription: return AppColors.warning;
      case RecordType.vaccination: return AppColors.success;
      case RecordType.history: return AppColors.teal;
    }
  }

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}
