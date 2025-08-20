import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint1 = Paint()..color = AppColors.backgroundgreen; 
    final paint2 = Paint()..color =Color(0xFF3C6255);
    final paint3 = Paint()..color = AppColors.backgroundColor;
    final paint4 = Paint()..color = AppColors.backgroundgreen;

    canvas.drawCircle(center, 260, paint1); 
    canvas.drawCircle(center, 220, paint2); 
    canvas.drawCircle(center, 190, paint3); 
    canvas.drawCircle(center, 150, paint4); 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}