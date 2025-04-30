import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double width;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: Text(
          title,
          style: AppTextStyles.quicksand18BoldB(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
