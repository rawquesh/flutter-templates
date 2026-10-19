
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'glass_card.dart';
import 'glass_chip.dart';

enum SymptomSeverity { mild, moderate, severe }

class SymptomCard extends StatelessWidget {
  final String symptomName;
  final SymptomSeverity severity;
  final String? duration;
  final VoidCallback? onRemove;
  final ValueChanged<SymptomSeverity>? onSeverityChanged;
  final bool isDark;

  const SymptomCard({
    super.key,
    required this.symptomName,
    this.severity = SymptomSeverity.mild,
    this.duration,
    this.onRemove,
    this.onSeverityChanged,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getSeverityColor().withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.medical_services_outlined,
                  color: _getSeverityColor(),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      symptomName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (duration != null)
                      Text(
                        'Duration: $duration',
                        style: theme.textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              if (onRemove != null)
                GestureDetector(
                  onTap: onRemove,
                  child: Icon(
                    Icons.close,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    size: 20,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Severity:',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(width: 12),
              ...SymptomSeverity.values.map((sev) {
                final isSelected = severity == sev;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: onSeverityChanged != null
                        ? () => onSeverityChanged!(sev)
                        : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? _getSeverityColorForType(sev).withValues(alpha: 0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? _getSeverityColorForType(sev)
                              : (isDark
                                  ? Colors.white.withValues(alpha: 0.2)
                                  : AppColors.dividerLight),
                        ),
                      ),
                      child: Text(
                        _getSeverityLabel(sev),
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected
                              ? _getSeverityColorForType(sev)
                              : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Color _getSeverityColor() {
    return _getSeverityColorForType(severity);
  }

  Color _getSeverityColorForType(SymptomSeverity sev) {
    switch (sev) {
      case SymptomSeverity.mild:
        return AppColors.success;
      case SymptomSeverity.moderate:
        return AppColors.warning;
      case SymptomSeverity.severe:
        return AppColors.error;
    }
  }

  String _getSeverityLabel(SymptomSeverity sev) {
    switch (sev) {
      case SymptomSeverity.mild:
        return 'Mild';
      case SymptomSeverity.moderate:
        return 'Moderate';
      case SymptomSeverity.severe:
        return 'Severe';
    }
  }
}

class PopularSymptomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isDark;

  const PopularSymptomChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassChip(
      label: label,
      isSelected: isSelected,
      onTap: onTap,
    );
  }
}
