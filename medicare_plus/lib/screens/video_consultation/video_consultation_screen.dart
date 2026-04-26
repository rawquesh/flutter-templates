import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_button.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/glass_avatar.dart';
import '../../theme/app_theme.dart';

class VideoConsultationScreen extends StatefulWidget {
  const VideoConsultationScreen({super.key});

  @override
  State<VideoConsultationScreen> createState() => _VideoConsultationScreenState();
}

class _VideoConsultationScreenState extends State<VideoConsultationScreen> with SingleTickerProviderStateMixin {
  bool _isDark = true;
  late TabController _tabController;

  final List<_Specialist> _specialists = [
    _Specialist(name: 'Sarah Wilson', specialty: 'Cardiologist', rating: 4.9, reviews: 128, nextAvailable: 'Today, 3:00 PM'),
    _Specialist(name: 'Michael Chen', specialty: 'Dermatologist', rating: 4.8, reviews: 95, nextAvailable: 'Today, 4:30 PM'),
    _Specialist(name: 'Emily Parker', specialty: 'General Physician', rating: 4.7, reviews: 156, nextAvailable: 'Tomorrow, 9:00 AM'),
    _Specialist(name: 'James Anderson', specialty: 'Orthopedic', rating: 4.6, reviews: 72, nextAvailable: 'Tomorrow, 2:00 PM'),
    _Specialist(name: 'Lisa Thompson', specialty: 'Pediatrician', rating: 4.9, reviews: 203, nextAvailable: 'Today, 5:00 PM'),
  ];

  final List<_Consultation> _history = [
    _Consultation(doctorName: 'Sarah Wilson', specialty: 'Cardiologist', date: DateTime(2026, 4, 15), duration: '15 min', summary: 'Follow-up on blood pressure medication adjustment'),
    _Consultation(doctorName: 'Michael Chen', specialty: 'Dermatologist', date: DateTime(2026, 4, 10), duration: '20 min', summary: 'Skin condition evaluation and treatment plan'),
    _Consultation(doctorName: 'Emily Parker', specialty: 'General Physician', date: DateTime(2026, 3, 28), duration: '10 min', summary: 'Annual health check-up review'),
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
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 6,
              onItemTap: (_) {},
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: Column(
              children: [
                _buildAppBar(),
                _buildUpcomingConsultation(),
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildSpecialistsList(),
                      _buildConsultationHistory(),
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
      selectedIndex: 6,
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
        'Video Consultation',
        style: TextStyle(
          color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
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

  Widget _buildUpcomingConsultation() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.videocam, color: AppColors.primaryBlue, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Next Consultation', style: TextStyle(fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
                      const SizedBox(height: 4),
                      Text('Today, 2:30 PM with Dr. Sarah Wilson', style: TextStyle(fontSize: 12, color: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                GlassButton(text: 'Join Call', variant: GlassButtonVariant.primary, icon: Icons.videocam, onPressed: () {}),
                const SizedBox(width: 12),
                GlassButton(text: 'Reschedule', variant: GlassButtonVariant.secondary, onPressed: () {}),
                const SizedBox(width: 8),
                GlassButton(text: 'Cancel', variant: GlassButtonVariant.outline, onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: _isDark ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(10)),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(4),
        labelColor: Colors.white,
        unselectedLabelColor: _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabs: const [Tab(text: 'Available Specialists'), Tab(text: 'History')],
      ),
    );
  }

  Widget _buildSpecialistsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHowItWorks(),
        const SizedBox(height: 24),
        Text('Available Specialists', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        ..._specialists.asMap().entries.map((entry) {
          final index = entry.key;
          final specialist = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SpecialistCard(specialist: specialist, isDark: _isDark),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
        }),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildHowItWorks() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How It Works', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _StepCard(number: 1, title: 'Book', subtitle: 'Select a specialist')),
              Expanded(child: _StepCard(number: 2, title: 'Join', subtitle: 'Connect via app')),
              Expanded(child: _StepCard(number: 3, title: 'Prescription', subtitle: 'Get your Rx')),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }

  Widget _buildConsultationHistory() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Past Consultations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        ..._history.asMap().entries.map((entry) {
          final index = entry.key;
          final consultation = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _HistoryCard(consultation: consultation, isDark: _isDark),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms);
        }),
        const SizedBox(height: 100),
      ],
    );
  }
}

class _Specialist {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final String nextAvailable;

  _Specialist({required this.name, required this.specialty, required this.rating, required this.reviews, required this.nextAvailable});
}

class _SpecialistCard extends StatelessWidget {
  final _Specialist specialist;
  final bool isDark;

  const _SpecialistCard({required this.specialist, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          GlassAvatar(size: 60, name: specialist.name),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dr. ${specialist.name}', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
                Text(specialist.specialty, style: const TextStyle(fontSize: 12, color: AppColors.primaryBlue)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: AppColors.warning),
                    const SizedBox(width: 4),
                    Text('${specialist.rating} (${specialist.reviews})', style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Next available:', style: TextStyle(fontSize: 10, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
              Text(specialist.nextAvailable, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.success)),
              const SizedBox(height: 8),
              GlassButton(text: 'Book', variant: GlassButtonVariant.primary, height: 36, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _Consultation {
  final String doctorName;
  final String specialty;
  final DateTime date;
  final String duration;
  final String summary;

  _Consultation({required this.doctorName, required this.specialty, required this.date, required this.duration, required this.summary});
}

class _HistoryCard extends StatelessWidget {
  final _Consultation consultation;
  final bool isDark;

  const _HistoryCard({required this.consultation, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GlassAvatar(size: 50, name: consultation.doctorName),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dr. ${consultation.doctorName}', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
                    Text(consultation.specialty, style: const TextStyle(fontSize: 12, color: AppColors.primaryBlue)),
                  ],
                ),
              ),
              Text(_formatDate(consultation.date), style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withOpacity(0.05) : AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                    const SizedBox(width: 4),
                    Text('Duration: ${consultation.duration}', style: TextStyle(fontSize: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(consultation.summary, style: TextStyle(fontSize: 14, color: isDark ? Colors.white : AppColors.textPrimaryLight)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GlassButton(text: 'View Summary', variant: GlassButtonVariant.secondary, height: 40, onPressed: () {}),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }
}

class _StepCard extends StatelessWidget {
  final int number;
  final String title;
  final String subtitle;

  const _StepCard({required this.number, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal]),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text('$number', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
