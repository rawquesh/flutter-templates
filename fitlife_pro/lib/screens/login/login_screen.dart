import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_button.dart';
import '../../widgets/glass_text_field.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAnimatedBackground(),
          _buildLoginCard(),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.loginBackgroundGradient,
      ),
      child: Stack(
        children: [
          _buildFloatingElements(),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 1.5,
                  colors: [
                    AppColors.primaryOrange.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomLeft,
                  radius: 1.2,
                  colors: [
                    AppColors.accentBlue.withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingElements() {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: 80,
              left: 30,
              child: _buildFloatingIcon(Icons.fitness_center, 0.3),
            ),
            Positioned(
              top: 150,
              right: 40,
              child: _buildFloatingIcon(Icons.directions_run, 0.5),
            ),
            Positioned(
              top: 250,
              left: 50,
              child: _buildFloatingIcon(Icons.favorite, 0.4),
            ),
            Positioned(
              bottom: 200,
              right: 60,
              child: _buildFloatingIcon(Icons.sports_gymnastics, 0.6),
            ),
            Positioned(
              bottom: 120,
              left: 40,
              child: _buildFloatingIcon(Icons.local_fire_department, 0.2),
            ),
            Positioned(
              top: 320,
              right: 30,
              child: _buildFloatingIcon(Icons.timer, 0.45),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFloatingIcon(IconData icon, double delay) {
    return Transform.translate(
      offset: Offset(
        0,
        10 * (_pulseController.value - 0.5),
      ),
      child: Icon(
        icon,
        size: 32,
        color: Colors.white.withValues(alpha: 0.1),
      ),
    )
        .animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        )
        .moveY(
          begin: -10,
          end: 10,
          duration: 2000.ms,
          curve: Curves.easeInOut,
          delay: (delay * 1000).ms,
        )
        .fade(begin: 0.3, end: 0.6, duration: 2000.ms);
  }

  Widget _buildLoginCard() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            const SizedBox(height: 32),
            _buildGlassLoginCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryOrange.withValues(alpha: 0.4),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Icon(
            Icons.local_fire_department,
            size: 48,
            color: Colors.white,
          ),
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .scale(begin: const Offset(0.5, 0.5), duration: 800.ms),
        const SizedBox(height: 16),
        const Text(
          'FitLife Pro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
        const Text(
          'Transform Your Body',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildGlassLoginCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
              const SizedBox(height: 24),
              GlassTextField(
                controller: _emailController,
                hintText: 'Email or Username',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.emailAddress,
              ).animate().fadeIn(delay: 300.ms, duration: 600.ms).slideX(begin: -0.1),
              const SizedBox(height: 16),
              GlassTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideX(begin: 0.1),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() => _rememberMe = value ?? false);
                        },
                        activeColor: AppColors.primaryOrange,
                        checkColor: Colors.white,
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primaryOrange,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
              const SizedBox(height: 24),
              _buildLoginButton().animate().fadeIn(delay: 600.ms, duration: 600.ms),
              const SizedBox(height: 24),
              _buildSocialLogin(),
              const SizedBox(height: 16),
              _buildCreateAccount(),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 800.ms).slideY(begin: 0.2);
  }

  Widget _buildLoginButton() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryOrange.withValues(alpha: 0.4 * _pulseAnimation.value),
                blurRadius: 20 * _pulseAnimation.value,
                spreadRadius: 2,
              ),
            ],
          ),
          child: GlassButton(
            text: 'Start Workout',
            icon: Icons.arrow_forward,
            type: GlassButtonType.gradient,
            onPressed: _handleLogin,
          ),
        );
      },
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'or continue with',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildSocialButton(
                icon: Icons.g_mobiledata,
                label: 'Google',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSocialButton(
                icon: Icons.apple,
                label: 'Apple',
              ),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 700.ms, duration: 600.ms);
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Create Account',
            style: TextStyle(
              color: AppColors.accentBlue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 800.ms, duration: 600.ms);
  }
}
