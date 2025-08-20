import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {
        if (context.canPop()) {
          context.pop(); // Use go_router's pop
        }
        // If no onPressed is provided and canPop is false, do nothing
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.backgroundgreen,
        ),
      ),
    );
  }
}