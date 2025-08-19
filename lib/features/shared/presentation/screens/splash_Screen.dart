import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Image(image: AssetImage('assets/img/Logo.png')),),
    );
  }
}