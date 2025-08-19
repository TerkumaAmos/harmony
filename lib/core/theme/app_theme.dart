import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'inter',
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: AppColors.background,
      
      
      

    )
  );
}