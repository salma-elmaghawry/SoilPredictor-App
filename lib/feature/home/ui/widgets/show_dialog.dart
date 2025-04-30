 import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/domain/cubit/soil_predictor_cubit.dart';

Future<dynamic> showdialog(
    BuildContext context,
    SoilPredictorError state, {
    String title = 'Error',
    String buttonText = 'OK',
  }) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(title),
            content: Text(state.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  buttonText,
                  style: AppTextStyles.poppins14Regular(
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
    );
  }