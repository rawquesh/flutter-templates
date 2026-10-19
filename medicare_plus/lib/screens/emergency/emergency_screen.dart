import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';

class EmergencyScreen extends StatelessWidget {
  final bool isDark;
  const EmergencyScreen({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          title: Text('Emergency', style: TextStyle(color: isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEmergencyButton(),
                const SizedBox(height: 24),
                _buildEmergencyServices(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmergencyButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.error, Color(0xFFFF5252)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.error.withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.emergency, color: Colors.white, size: 48),
          const SizedBox(height: 16),
          const Text('EMERGENCY', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 8),
          const Text('Tap to call emergency services', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.error),
            child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.phone), SizedBox(width: 8), Text('CALL 911')]),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1));
  }

  Widget _buildEmergencyServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Emergency Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _ServiceCard(title: 'Emergency', icon: Icons.local_hospital, color: AppColors.error, onTap: () {})),
            const SizedBox(width: 12),
            Expanded(child: _ServiceCard(title: 'Ambulance', icon: Icons.directions_car, color: AppColors.warning, onTap: () {})),
            const SizedBox(width: 12),
            Expanded(child: _ServiceCard(title: 'Poison Control', icon: Icons.warning, color: AppColors.primaryBlue, onTap: () {})),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const _ServiceCard({required this.title, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.grey[800]), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
