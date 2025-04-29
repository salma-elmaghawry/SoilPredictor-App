import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';


Widget buildOptionCard(
  BuildContext context, {
  required String assetImage,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 350,
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.primary, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetImage, width: 50, height: 50),
          const SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.poppins14Regular(
              color: AppColors.textPrimary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
