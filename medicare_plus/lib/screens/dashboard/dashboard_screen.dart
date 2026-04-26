import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_avatar.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../theme/app_theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;
  int _selectedSidebarIndex = 0;
  bool _isDark = true;

  final List<_HealthMetric> _healthMetrics = [
    _HealthMetric(icon: Icons.favorite, label: 'Heart Rate', value: '72 bpm', trend: '+2', color: AppColors.heartRate),
    _HealthMetric(icon: Icons.speed, label: 'Blood Pressure', value: '120/80', trend: '-3', color: AppColors.bloodPressure),
    _HealthMetric(icon: Icons.bedtime, label: 'Sleep', value: '7h 30m', trend: '+1h', color: AppColors.sleep),
    _HealthMetric(icon: Icons.directions_walk, label: 'Steps', value: '8,432', trend: '+1.2k', color: AppColors.steps),
  ];

  final List<_UpcomingAppointment> _upcomingAppointments = [
    _UpcomingAppointment(name: 'Sarah Wilson', specialty: 'Cardiologist', date: 'Today, 2:30 PM', doctorName: 'Dr. Sarah Wilson'),
    _UpcomingAppointment(name: 'Michael Chen', specialty: 'Dermatologist', date: 'Tomorrow, 10:00 AM', doctorName: 'Dr. Michael Chen'),
    _UpcomingAppointment(name: 'Emily Parker', specialty: 'General Physician', date: 'Mar 28, 11:30 AM', doctorName: 'Dr. Emily Parker'),
  ];

  final List<_HealthTip> _healthTips = [
    _HealthTip(title: 'Stay Hydrated', subtitle: 'Drink at least 8 glasses of water daily'),
    _HealthTip(title: 'Morning Exercise', subtitle: 'A 30-minute walk boosts energy'),
    _HealthTip(title: 'Sleep Well', subtitle: 'Maintain consistent sleep schedule'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: _selectedSidebarIndex,
              onItemTap: (index) => setState(() => _selectedSidebarIndex = index),
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildGreeting(),
                        const SizedBox(height: 24),
                        _buildQuickActions(),
                        const SizedBox(height: 24),
                        _buildHealthMetrics(),
                        const SizedBox(height: 24),
                        _buildUpcomingAppointments(),
                        const SizedBox(height: 24),
                        _buildHealthTips(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: _selectedNavIndex,
        onTap: (index) => setState(() => _selectedNavIndex = index),
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
      selectedIndex: _selectedSidebarIndex,
      onItemTap: (index) => setState(() => _selectedSidebarIndex = index),
      onThemeToggle: () => setState(() => _isDark = !_isDark),
      currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
      isDark: _isDark,
      child: const SizedBox(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.teal],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.favorite_border, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            'MediCare+',
            style: TextStyle(
              color: _isDark ? Colors.white : AppColors.textPrimaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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

  Widget _buildGreeting() {
    final hour = DateTime.now().hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    final months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    final now = DateTime.now();
    final dateString = '${months[now.month - 1]} ${now.day}, ${now.year}';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$greeting,',
                style: TextStyle(
                  fontSize: 16,
                  color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isDark ? Colors.white : AppColors.textPrimaryLight,
                ),
              ),
              Text(
                dateString,
                style: TextStyle(
                  fontSize: 14,
                  color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
        GlassAvatar(
          size: 50,
          name: 'John Doe',
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideX(begin: -0.1, end: 0);
  }

  Widget _buildQuickActions() {
    final actions = [
      _QuickAction(icon: Icons.calendar_month, label: 'Book', color: AppColors.primaryBlue),
      _QuickAction(icon: Icons.search, label: 'Find Doctor', color: AppColors.teal),
      _QuickAction(icon: Icons.health_and_safety, label: 'Health Check', color: AppColors.success),
      _QuickAction(icon: Icons.emergency, label: 'Emergency', color: AppColors.error),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: actions.asMap().entries.map((entry) {
            final index = entry.key;
            final action = entry.value;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: index < actions.length - 1 ? 8 : 0),
                child: _QuickActionCard(action: action, isDark: _isDark),
              ),
            );
          }).toList(),
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 100.ms, duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }

  Widget _buildHealthMetrics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Metrics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _healthMetrics.length,
            itemBuilder: (context, index) {
              final metric = _healthMetrics[index];
              return Padding(
                padding: EdgeInsets.only(right: index < _healthMetrics.length - 1 ? 12 : 0),
                child: _HealthMetricCard(metric: metric, isDark: _isDark),
              );
            },
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 200.ms, duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }

  Widget _buildUpcomingAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Appointments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _isDark ? Colors.white : AppColors.textPrimaryLight,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(color: AppColors.primaryBlue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _upcomingAppointments.length,
            itemBuilder: (context, index) {
              final appointment = _upcomingAppointments[index];
              return Padding(
                padding: EdgeInsets.only(right: index < _upcomingAppointments.length - 1 ? 12 : 0),
                child: _AppointmentCard(appointment: appointment, isDark: _isDark),
              );
            },
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(delay: 300.ms, duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }

  Widget _buildHealthTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health Tips',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 12),
        ..._healthTips.asMap().entries.map((entry) {
          final tip = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _HealthTipCard(tip: tip, isDark: _isDark),
          );
        }),
      ],
    )
        .animate()
        .fadeIn(delay: 400.ms, duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;

  _QuickAction({required this.icon, required this.label, required this.color});
}

class _QuickActionCard extends StatelessWidget {
  final _QuickAction action;
  final bool isDark;

  const _QuickActionCard({required this.action, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: action.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(action.icon, color: action.color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            action.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _HealthMetric {
  final IconData icon;
  final String label;
  final String value;
  final String trend;
  final Color color;

  _HealthMetric({
    required this.icon,
    required this.label,
    required this.value,
    required this.trend,
    required this.color,
  });
}

class _HealthMetricCard extends StatelessWidget {
  final _HealthMetric metric;
  final bool isDark;

  const _HealthMetricCard({required this.metric, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 130,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: metric.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(metric.icon, color: metric.color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            metric.label,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            metric.value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.trending_up,
                size: 14,
                color: AppColors.success,
              ),
              const SizedBox(width: 4),
              Text(
                metric.trend,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UpcomingAppointment {
  final String name;
  final String specialty;
  final String date;
  final String doctorName;

  _UpcomingAppointment({
    required this.name,
    required this.specialty,
    required this.date,
    required this.doctorName,
  });
}

class _AppointmentCard extends StatelessWidget {
  final _UpcomingAppointment appointment;
  final bool isDark;

  const _AppointmentCard({required this.appointment, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GlassAvatar(size: 40, name: appointment.name),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctorName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppColors.textPrimaryLight,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      appointment.specialty,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.access_time, size: 14, color: AppColors.primaryBlue),
                const SizedBox(width: 6),
                Text(
                  appointment.date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthTip {
  final String title;
  final String subtitle;

  _HealthTip({required this.title, required this.subtitle});
}

class _HealthTipCard extends StatelessWidget {
  final _HealthTip tip;
  final bool isDark;

  const _HealthTipCard({required this.tip, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.teal],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.lightbulb, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tip.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tip.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ],
      ),
    );
  }
}
