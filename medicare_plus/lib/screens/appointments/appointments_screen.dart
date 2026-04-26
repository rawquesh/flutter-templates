import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/appointment_card.dart';
import '../../theme/app_theme.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> with SingleTickerProviderStateMixin {
  bool _isDark = true;
  late TabController _tabController;

  final List<_Appointment> _appointments = [
    _Appointment(doctorName: 'Sarah Wilson', specialty: 'Cardiologist', date: DateTime(2026, 4, 26, 14, 30), location: 'MediCare Clinic', status: AppointmentStatus.upcoming),
    _Appointment(doctorName: 'Michael Chen', specialty: 'Dermatologist', date: DateTime(2026, 4, 27, 10, 0), location: 'Skin Care Center', status: AppointmentStatus.upcoming),
    _Appointment(doctorName: 'Emily Parker', specialty: 'General Physician', date: DateTime(2026, 4, 20, 11, 0), location: 'MediCare Clinic', status: AppointmentStatus.completed),
    _Appointment(doctorName: 'James Anderson', specialty: 'Orthopedic', date: DateTime(2026, 4, 18, 9, 30), location: 'Bone & Joint Center', status: AppointmentStatus.cancelled),
    _Appointment(doctorName: 'Lisa Thompson', specialty: 'Pediatrician', date: DateTime(2026, 3, 15, 15, 0), location: 'Children Health Center', status: AppointmentStatus.completed),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
              selectedIndex: 2,
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
                      _buildAppointmentList(AppointmentStatus.upcoming),
                      _buildAppointmentList(AppointmentStatus.completed),
                      _buildAppointmentList(AppointmentStatus.cancelled),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: 2,
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
      selectedIndex: 2,
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
        'My Appointments',
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
          Tab(text: 'Upcoming'),
          Tab(text: 'Completed'),
          Tab(text: 'Cancelled'),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildAppointmentList(AppointmentStatus status) {
    final filteredAppointments = _appointments.where((a) => a.status == status).toList();

    if (filteredAppointments.isEmpty) {
      return _buildEmptyState(status);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        final appointment = filteredAppointments[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AppointmentCard(
            doctorName: appointment.doctorName,
            specialty: appointment.specialty,
            dateTime: appointment.date,
            location: appointment.location,
            status: appointment.status,
            isDark: _isDark,
            onReschedule: status == AppointmentStatus.upcoming ? () {} : null,
            onCancel: status == AppointmentStatus.upcoming ? () {} : null,
            onJoinCall: status == AppointmentStatus.upcoming ? () {} : null,
          ),
        ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms).slideY(begin: 0.1, end: 0);
      },
    );
  }

  Widget _buildEmptyState(AppointmentStatus status) {
    String title;
    String message;
    IconData icon;

    switch (status) {
      case AppointmentStatus.upcoming:
        title = 'No Upcoming Appointments';
        message = 'Book an appointment with one of our specialists';
        icon = Icons.calendar_today_outlined;
        break;
      case AppointmentStatus.completed:
        title = 'No Completed Appointments';
        message = 'Your completed appointments will appear here';
        icon = Icons.check_circle_outline;
        break;
      case AppointmentStatus.cancelled:
        title = 'No Cancelled Appointments';
        message = 'You have no cancelled appointments';
        icon = Icons.cancel_outlined;
        break;
      default:
        title = 'No Appointments';
        message = 'No appointments found';
        icon = Icons.event_busy;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _isDark ? Colors.white : AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}

class _Appointment {
  final String doctorName;
  final String specialty;
  final DateTime date;
  final String location;
  final AppointmentStatus status;

  _Appointment({
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.location,
    required this.status,
  });
}
