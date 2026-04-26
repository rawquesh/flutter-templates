import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;

  const GlassToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? AppColors.primaryBlue,
      activeTrackColor: (activeColor ?? AppColors.primaryBlue).withOpacity(0.3),
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.withOpacity(0.3),
    );
  }
}
