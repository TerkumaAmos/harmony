import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboard();
  }

  Future<void> _navigateToOnboard() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go('/onboard'); // Use GoRouter to navigate
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image(image: AssetImage('assets/img/Logo.png')),
      ),
    );
  }
}