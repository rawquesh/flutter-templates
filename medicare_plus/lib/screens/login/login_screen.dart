import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/animated_background.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_text_field.dart';
import '../app_shell.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isLoading = false);
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const AppShell(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(enableAnimation: true),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: _buildGlassCard(size),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard(Size size) {
    return GlassCard(
      width: size.width > 500 ? 450 : double.infinity,
      padding: const EdgeInsets.all(32),
      borderRadius: AppConstants.radiusLarge,
      opacity: 0.15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogo(),
          const SizedBox(height: 24),
          _buildWelcomeText(),
          const SizedBox(height: 32),
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 12),
          _buildRememberForgotRow(),
          const SizedBox(height: 24),
          _buildLoginButton(),
          const SizedBox(height: 24),
          _buildSocialLogin(),
          const SizedBox(height: 24),
          _buildSignUpLink(),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 500.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildLogo() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.favorite,
        color: Colors.white,
        size: 40,
      ),
    )
        .animate()
        .scale(delay: 100.ms, duration: 400.ms, curve: Curves.easeOutBack);
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Welcome to MediCare+',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Your trusted health companion',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return GlassTextField(
      controller: _emailController,
      hintText: 'Email or Username',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return GlassTextField(
      controller: _passwordController,
      hintText: 'Password',
      prefixIcon: Icons.lock_outline,
      obscureText: true,
    );
  }

  Widget _buildRememberForgotRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() => _rememberMe = !_rememberMe),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _rememberMe
                      ? AppColors.primaryBlue
                      : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: _rememberMe
                        ? AppColors.primaryBlue
                        : Colors.white.withOpacity(0.3),
                  ),
                ),
                child: _rememberMe
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
              const SizedBox(width: 8),
              Text(
                'Remember me',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: AppColors.primaryBlueLight,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: AppColors.primaryBlue.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'or continue with',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              icon: Icons.g_mobiledata,
              label: 'Google',
              onTap: () {},
            ),
            const SizedBox(width: 16),
            _SocialButton(
              icon: Icons.apple,
              label: 'Apple',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.primaryBlueLight,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
