import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:harmony_hush/shared/widgets/buttons/primary_button.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Column(
        children: [
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Image(image: AssetImage('assets/img/meditation.png')),
          ),
          SizedBox(height: 100),
          Text(
            'We are What we do',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 30),
          Text(
            'Foster global peace and well being through\n accessible, guided meditation practices.',
            style: GoogleFonts.inter(fontSize: 14, color: AppColors.textgrey),
          ),
          SizedBox(height: 30),
          PrimaryButton(
            onPressed: () {
              context.go('/signUp'); // Navigate to sign up page
            },
            label: 'SIGN UP',
            width: 320,
            height: 55,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: GoogleFonts.inter(fontSize: 14, color: AppColors.textgrey),
              ),
              GestureDetector(
                onTap: () {
                  context.go('/signIn'); // Navigate to sign in page
                },
                child: Text(
                  ' SIGN IN',
                  style: GoogleFonts.inter(fontSize: 14, color: AppColors.textgreen, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}