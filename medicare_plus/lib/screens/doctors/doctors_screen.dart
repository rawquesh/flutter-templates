import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_text_field.dart';
import '../../widgets/glass_chip.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/doctor_card.dart';
import '../../theme/app_theme.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  bool _isDark = true;
  int _selectedSpecialty = 0;
  final Set<String> _favorites = {};

  final List<_Doctor> _doctors = [
    _Doctor(name: 'Sarah Wilson', specialty: 'Cardiologist', rating: 4.9, reviews: 128, experience: 12),
    _Doctor(name: 'Michael Chen', specialty: 'Dermatologist', rating: 4.8, reviews: 95, experience: 8),
    _Doctor(name: 'Emily Parker', specialty: 'General Physician', rating: 4.7, reviews: 156, experience: 15),
    _Doctor(name: 'James Anderson', specialty: 'Orthopedic', rating: 4.6, reviews: 72, experience: 10),
    _Doctor(name: 'Lisa Thompson', specialty: 'Pediatrician', rating: 4.9, reviews: 203, experience: 18),
    _Doctor(name: 'Robert Garcia', specialty: 'Neurologist', rating: 4.8, reviews: 88, experience: 14),
  ];

  final List<String> _specialties = [
    'All',
    'Cardiologist',
    'Dermatologist',
    'General',
    'Orthopedic',
    'Pediatrician',
    'Neurologist',
    'Dentist',
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
              selectedIndex: 1,
              onItemTap: (_) {},
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
                        _buildSearchBar(),
                        const SizedBox(height: 16),
                        _buildSpecialtyChips(),
                        const SizedBox(height: 24),
                        _buildDoctorList(),
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
        currentIndex: 1,
        onTap: (_) {},
        items: const [
          GlassBottomNavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
          GlassBottomNavItem(icon: Icons.medical_services_outlined, activeIcon: Icons.medical_services, label: 'Doctors'),
          GlassBottomNavItem(icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today, label: 'Appointments'),
          GlassBottomNavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildDrawer() {
    return GlassDrawer(
      selectedIndex: 1,
      onItemTap: (_) {},
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
      title: Text(
        'Find Doctors',
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

  Widget _buildSearchBar() {
    return GlassSearchField(
      hintText: 'Search doctors by name or specialty...',
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildSpecialtyChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Specialties',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _isDark ? Colors.white : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _specialties.asMap().entries.map((entry) {
              final index = entry.key;
              final specialty = entry.value;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GlassChip(
                  label: specialty,
                  isSelected: _selectedSpecialty == index,
                  onTap: () => setState(() => _selectedSpecialty = index),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildDoctorList() {
    final filteredDoctors = _selectedSpecialty == 0
        ? _doctors
        : _doctors.where((d) => d.specialty == _specialties[_selectedSpecialty]).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${filteredDoctors.length} Doctors Available',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _isDark ? Colors.white : AppColors.textPrimaryLight,
              ),
            ),
            GlassChip(
              label: 'Sort by Rating',
              icon: Icons.sort,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...filteredDoctors.asMap().entries.map((entry) {
          final index = entry.key;
          final doctor = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DoctorCard(
              name: doctor.name,
              specialty: doctor.specialty,
              rating: doctor.rating,
              reviewCount: doctor.reviews,
              experienceYears: doctor.experience,
              isFavorite: _favorites.contains(doctor.name),
              isDark: _isDark,
              onTap: () {},
              onBookTap: () {},
              onFavoriteTap: () {
                setState(() {
                  if (_favorites.contains(doctor.name)) {
                    _favorites.remove(doctor.name);
                  } else {
                    _favorites.add(doctor.name);
                  }
                });
              },
            ),
          ).animate().fadeIn(delay: Duration(milliseconds: 100 * index), duration: 400.ms).slideX(begin: 0.1, end: 0);
        }),
      ],
    );
  }
}

class _Doctor {
  final String name;
  final String specialty;
  final double rating;
  final int reviews;
  final int experience;

  _Doctor({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviews,
    required this.experience,
  });
}
