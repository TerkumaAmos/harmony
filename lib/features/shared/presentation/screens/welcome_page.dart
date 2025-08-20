import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';
import 'package:harmony_hush/features/shared/widgets/Custompaint/circle_painter.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              // Welcome Text
              Text(
                'Hi Agber Amos! Welcome\n         to Harmony Hush',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textwhite,
                ),
              ),
              // Subtitle Text
              Text(
                'Explore inner Peace, One Meditation at a Time',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textgrey,
                ),
              ),
              // Second Stack (Image at bottom-right)
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
              // CirclePainter with image on top
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    // Ensure CustomPaint maintains its size
                    Container(
                      width: 300,
                      height: 300,
                      child: CustomPaint(
                        size: Size(300, 300),
                        painter: CirclePainter(),
                      ),
                    ),
                    // First image on top of the circles
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
            ],
          ),
          // Circular green block from the bottom, full width
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
          // Large girl.png image on top of the green container and CirclePainter
          Positioned(
            bottom: 140, // Adjust to sit on the green container
            left: (screenWidth -290) / 2, // Center horizontally
            child: Image.asset(
              'assets/img/girl.png',
              height: 300, // Larger size
              width: 300,  // Larger size
              filterQuality: FilterQuality.medium,
            ),
          ),
        ],
      ),
    );
  }
}