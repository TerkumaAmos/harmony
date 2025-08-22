import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';

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
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print('Firebase initialization error: $e');
    }
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go('/onboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          'assets/img/Logo.png',
          width: 400,
          height: 400,
         fit: BoxFit.contain,
        ),
      ),
    );
  }
}