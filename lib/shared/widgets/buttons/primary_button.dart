import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderColor;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.width,
    this.height,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.icon,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = borderRadius ?? BorderRadius.circular(30);

    final child = isLoading
        ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.textwhite,
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(
                  color: backgroundColor == Colors.white
                      ? AppColors.backgroundgreen
                      : AppColors.textwhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 16, // Increased font size
                ),
              ),
            ],
          );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60, // Increased default height from 36 to 60
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.backgroundgreen,
          foregroundColor: AppColors.textwhite,
          elevation: elevation ?? 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusValue,
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 2)
                : BorderSide.none,
          ),
          disabledBackgroundColor:
              (backgroundColor ?? AppColors.backgroundgreen).withOpacity(0.5),
        ),
        child: child,
      ),
    );
  }
}