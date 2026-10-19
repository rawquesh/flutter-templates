import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_text_field.dart';
import '../../widgets/glass_chip.dart';
import '../../widgets/glass_badge.dart';
import '../../widgets/glass_button.dart';

class SymptomCheckerScreen extends StatefulWidget {
  final bool isDark;

  const SymptomCheckerScreen({super.key, required this.isDark});

  @override
  State<SymptomCheckerScreen> createState() => _SymptomCheckerScreenState();
}

class _SymptomCheckerScreenState extends State<SymptomCheckerScreen> {
  final List<String> _selectedSymptoms = [];
  bool _showResults = false;

  static final List<String> _popularSymptoms = ['Headache', 'Fever', 'Cough', 'Fatigue', 'Sore Throat', 'Nausea', 'Dizziness', 'Chest Pain'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        floating: true,
        backgroundColor: widget.isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        title: Row(children: [
          Text('Symptom Checker', style: TextStyle(color: widget.isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          IconButton(icon: const Icon(Icons.info_outline, color: AppColors.primaryBlue), onPressed: () {}),
        ]),
      ),
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildEmergencyBanner(),
        const SizedBox(height: 24),
        _buildSearchSection(),
        const SizedBox(height: 24),
        _buildPopularSymptoms(),
        const SizedBox(height: 24),
        _buildSymptomList(),
        if (_selectedSymptoms.isNotEmpty) ...[const SizedBox(height: 24), _buildAnalyzeButton()],
        if (_showResults) ...[const SizedBox(height: 24), _buildResults()],
        const SizedBox(height: 100),
      ]))),
    ]);
  }

  Widget _buildEmergencyBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(children: [
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.error.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.emergency, color: AppColors.error, size: 28)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Emergency?', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.error, fontSize: 16)),
          const SizedBox(height: 4),
          Text('If you are experiencing a medical emergency, please call emergency services immediately.', style: TextStyle(fontSize: 12, color: widget.isDark ? Colors.white70 : Colors.black54)),
        ])),
        ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.error), child: const Text('Call 911')),
      ]),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildSearchSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Describe Your Symptoms', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 8),
      Text('Enter or select your symptoms for a preliminary assessment', style: TextStyle(color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
      const SizedBox(height: 16),
      GlassSearchField(hintText: 'Describe your symptoms...'),
    ]).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildPopularSymptoms() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Popular Symptoms', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: _popularSymptoms.map((symptom) {
        final isSelected = _selectedSymptoms.contains(symptom);
        return GlassChip(label: symptom, isSelected: isSelected, onTap: () {
          setState(() {
            if (isSelected) { _selectedSymptoms.remove(symptom); } else { _selectedSymptoms.add(symptom); }
          });
        });
      }).toList()),
    ]).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }

  Widget _buildSymptomList() {
    if (_selectedSymptoms.isEmpty) {
      return GlassCard(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.checklist, size: 48, color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
        const SizedBox(height: 12),
        Text('Select symptoms above to get started', style: TextStyle(color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
      ])));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Selected Symptoms (${_selectedSymptoms.length})', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 12),
      ..._selectedSymptoms.map((symptom) => Padding(padding: const EdgeInsets.only(bottom: 8), child: _SelectedSymptomCard(symptom: symptom, isDark: widget.isDark, onRemove: () => setState(() => _selectedSymptoms.remove(symptom)))).animate().fadeIn(duration: 300.ms)),
    ]);
  }

  Widget _buildAnalyzeButton() {
    return GlassButton(text: 'Analyze Symptoms', variant: GlassButtonVariant.gradient, icon: Icons.analytics, isExpanded: true, height: 56, onPressed: () => setState(() => _showResults = true)).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildResults() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Analysis Results', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 16),
      _buildPossibleConditions(),
      const SizedBox(height: 16),
      _buildUrgencyLevel(),
      const SizedBox(height: 16),
      _buildRecommendedActions(),
      const SizedBox(height: 16),
      _buildDisclaimer(),
    ]).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildPossibleConditions() {
    return GlassCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Possible Conditions', style: TextStyle(fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 16),
      _ConditionRow(name: 'Common Cold', probability: 0.75, isDark: widget.isDark),
      const SizedBox(height: 12),
      _ConditionRow(name: 'Seasonal Allergies', probability: 0.45, isDark: widget.isDark),
      const SizedBox(height: 12),
      _ConditionRow(name: 'Sinusitis', probability: 0.30, isDark: widget.isDark),
    ]));
  }

  Widget _buildUrgencyLevel() {
    return GlassCard(child: Row(children: [
      Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.warning.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.access_time, color: AppColors.warning, size: 28)),
      const SizedBox(width: 16),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Urgency Level', style: TextStyle(fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 4),
        GlassBadge(label: 'See Doctor', type: GlassBadgeType.warning),
      ])),
    ]));
  }

  Widget _buildRecommendedActions() {
    return GlassCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Recommended Actions', style: TextStyle(fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
      const SizedBox(height: 16),
      _ActionItem(icon: Icons.local_hospital, title: 'Consult General Physician', subtitle: 'Book an appointment with a primary care doctor'),
      const SizedBox(height: 12),
      _ActionItem(icon: Icons.self_improvement, title: 'Rest and Hydrate', subtitle: 'Drink plenty of fluids and get adequate sleep'),
      const SizedBox(height: 12),
      _ActionItem(icon: Icons.monitor_heart, title: 'Monitor Temperature', subtitle: 'Track your fever if present'),
    ]));
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.primaryBlue.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.2))),
      child: Row(children: [
        const Icon(Icons.info_outline, color: AppColors.primaryBlue),
        const SizedBox(width: 12),
        Expanded(child: Text('This is not a medical diagnosis. Please consult a healthcare professional for proper evaluation and treatment.', style: TextStyle(fontSize: 12, color: widget.isDark ? Colors.white70 : Colors.black54))),
      ]),
    );
  }
}

class _SelectedSymptomCard extends StatelessWidget {
  final String symptom;
  final bool isDark;
  final VoidCallback onRemove;
  const _SelectedSymptomCard({required this.symptom, required this.isDark, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Row(children: [
        Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.primaryBlue.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.medical_services_outlined, color: AppColors.primaryBlue, size: 20)),
        const SizedBox(width: 12),
        Expanded(child: Text(symptom, style: TextStyle(fontWeight: FontWeight.w500, color: isDark ? Colors.white : AppColors.textPrimaryLight))),
        GlassChip(label: 'Moderate', isSelected: true, onTap: () {}),
        const SizedBox(width: 8),
        GestureDetector(onTap: onRemove, child: const Icon(Icons.close, size: 20)),
      ]),
    );
  }
}

class _ConditionRow extends StatelessWidget {
  final String name;
  final double probability;
  final bool isDark;
  const _ConditionRow({required this.name, required this.probability, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(name, style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimaryLight)),
        Text('${(probability * 100).toInt()}%', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primaryBlue)),
      ]),
      const SizedBox(height: 4),
      LinearProgressIndicator(value: probability, backgroundColor: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey[200], valueColor: const AlwaysStoppedAnimation(AppColors.primaryBlue)),
    ]);
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const _ActionItem({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: AppColors.success, size: 20)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ])),
    ]);
  }
}
