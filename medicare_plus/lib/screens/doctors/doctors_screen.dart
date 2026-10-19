import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_text_field.dart';
import '../../widgets/glass_chip.dart';
import '../../widgets/doctor_card.dart';

class DoctorsScreen extends StatefulWidget {
  final bool isDark;

  const DoctorsScreen({super.key, required this.isDark});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  int _selectedSpecialty = 0;
  final Set<String> _favorites = {};

  static final List<_Doctor> _doctors = [
    _Doctor(name: 'Sarah Wilson', specialty: 'Cardiologist', rating: 4.9, reviews: 128, experience: 12),
    _Doctor(name: 'Michael Chen', specialty: 'Dermatologist', rating: 4.8, reviews: 95, experience: 8),
    _Doctor(name: 'Emily Parker', specialty: 'General Physician', rating: 4.7, reviews: 156, experience: 15),
    _Doctor(name: 'James Anderson', specialty: 'Orthopedic', rating: 4.6, reviews: 72, experience: 10),
    _Doctor(name: 'Lisa Thompson', specialty: 'Pediatrician', rating: 4.9, reviews: 203, experience: 18),
    _Doctor(name: 'Robert Garcia', specialty: 'Neurologist', rating: 4.8, reviews: 88, experience: 14),
  ];

  static final List<String> _specialties = [
    'All', 'Cardiologist', 'Dermatologist', 'General Physician', 'Orthopedic', 'Pediatrician', 'Neurologist',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: widget.isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          title: Text(
            'Find Doctors',
            style: TextStyle(
              color: widget.isDark ? Colors.white : AppColors.textPrimaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [SizedBox(width: 16)],
        ),
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
            color: widget.isDark ? Colors.white : AppColors.textPrimaryLight,
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
                color: widget.isDark ? Colors.white : AppColors.textPrimaryLight,
              ),
            ),
            GlassChip(label: 'Sort by Rating', icon: Icons.sort, onTap: () {}),
          ],
        ),
        const SizedBox(height: 16),
        if (filteredDoctors.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.medical_services_outlined,
                    size: 64,
                    color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No doctors found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: widget.isDark ? Colors.white : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Try a different specialty',
                    style: TextStyle(
                      color: widget.isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              isDark: widget.isDark,
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

  _Doctor({required this.name, required this.specialty, required this.rating, required this.reviews, required this.experience});
}
