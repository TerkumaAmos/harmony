import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:harmony_hush/features/shared/widgets/Custompaint/circle_painter.dart';
import 'package:harmony_hush/shared/widgets/buttons/primary_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'User';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      right: 20,
                      top: 100,
                      child: Image.asset(
                        'assets/img/heart_half.png',
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Hi $displayName! Welcome\nto Harmony Hush',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textwhite,
                ),
              ),
              Text(
                'Explore inner Peace, One Meditation at a Time',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textgrey,
                ),
              ),
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      right: 70,
                      top: 50,
                      child: Image.asset(
                        'assets/img/cloud 3.png',
                      ),
                    ),
                    Positioned(
                      right: 230,
                      top: 90,
                      child: Image.asset(
                        'assets/img/cloud.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: CustomPaint(
                        size: Size(300, 300),
                        painter: CirclePainter(),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      child: Image.asset(
                        'assets/img/full_heart.png',
                        height: 42,
                        width: 44,
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  context.go('/home');
                },
                label: 'GET STARTED',
                width: 360,
                height: 60,
              ),
            ],
          ),
          Positioned(
            bottom: -180,
            left: 0,
            right: 0,
            child: Container(
              height: screenWidth,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xFF3C6255),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 140,
            left: (screenWidth - 290) / 2,
            child: Image.asset(
              'assets/img/girl.png',
              height: 300,
              width: 300,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ],
      ),
    );
  }
}