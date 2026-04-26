
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';
import 'glass_card.dart';
import 'glass_button.dart';

class EmergencyContactCard extends StatelessWidget {
  final String name;
  final String? phone;
  final String? relationship;
  final VoidCallback? onCallTap;
  final VoidCallback? onEditTap;
  final bool isICE;
  final bool isDark;

  const EmergencyContactCard({
    super.key,
    required this.name,
    this.phone,
    this.relationship,
    this.onCallTap,
    this.onEditTap,
    this.isICE = false,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isICE
                  ? AppColors.error.withOpacity(0.2)
                  : AppColors.primaryBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isICE ? Icons.emergency : Icons.person,
              color: isICE ? AppColors.error : AppColors.primaryBlue,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isICE) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'ICE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (relationship != null)
                  Text(
                    relationship!,
                    style: theme.textTheme.bodySmall,
                  ),
                if (phone != null)
                  Text(
                    phone!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryBlue,
                    ),
                  ),
              ],
            ),
          ),
          if (onCallTap != null)
            GlassIconButton(
              icon: Icons.phone,
              size: 44,
              showGlassBackground: false,
              iconColor: AppColors.success,
              onPressed: onCallTap,
            ),
          if (onEditTap != null) ...[
            const SizedBox(width: 8),
            GlassIconButton(
              icon: Icons.edit,
              size: 44,
              showGlassBackground: false,
              iconColor: AppColors.primaryBlue,
              onPressed: onEditTap,
            ),
          ],
        ],
      ),
    );
  }
}

class EmergencyServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  final bool isLarge;

  const EmergencyServiceCard({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.onTap,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final emergencyColor = color ?? AppColors.error;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(isLarge ? 24 : 16),
        decoration: BoxDecoration(
          color: emergencyColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(
            color: emergencyColor.withOpacity(0.3),
            width: isLarge ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: isLarge ? 60 : 48,
              height: isLarge ? 60 : 48,
              decoration: BoxDecoration(
                color: emergencyColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: emergencyColor,
                size: isLarge ? 32 : 24,
              ),
            ),
            SizedBox(height: isLarge ? 12 : 8),
            Text(
              title,
              style: (isLarge
                      ? theme.textTheme.titleMedium
                      : theme.textTheme.bodySmall)
                  ?.copyWith(
                fontWeight: FontWeight.bold,
                color: emergencyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MedicalInfoCard extends StatelessWidget {
  final String bloodType;
  final List<String> allergies;
  final List<String> conditions;
  final List<String> medications;
  final VoidCallback? onEditTap;
  final bool isDark;

  const MedicalInfoCard({
    super.key,
    required this.bloodType,
    required this.allergies,
    required this.conditions,
    required this.medications,
    this.onEditTap,
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.medical_information,
                  color: AppColors.error,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medical Information',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Essential for emergencies',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (onEditTap != null)
                GlassIconButton(
                  icon: Icons.edit,
                  size: 40,
                  onPressed: onEditTap,
                ),
            ],
          ),
          const SizedBox(height: 20),
          _InfoRow(
            label: 'Blood Type',
            value: bloodType,
            icon: Icons.bloodtype,
            valueColor: AppColors.error,
            isDark: isDark,
          ),
          const SizedBox(height: 12),
          if (allergies.isNotEmpty) ...[
            _InfoRow(
              label: 'Allergies',
              value: allergies.join(', '),
              icon: Icons.warning_amber,
              valueColor: AppColors.warning,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],
          if (conditions.isNotEmpty) ...[
            _InfoRow(
              label: 'Conditions',
              value: conditions.join(', '),
              icon: Icons.healing,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
          ],
          if (medications.isNotEmpty)
            _InfoRow(
              label: 'Medications',
              value: medications.join(', '),
              icon: Icons.medication,
              isDark: isDark,
            ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? valueColor;
  final bool isDark;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
    this.valueColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: valueColor ??
              (isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall,
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
