import 'package:flutter/material.dart';
import 'package:harmony_hush/core/theme/app_colors.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
       
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
    
      child: Icon(
        Icons.arrow_back,
        color: AppColors.backgroundgreen,
      ),
    );
  }
}