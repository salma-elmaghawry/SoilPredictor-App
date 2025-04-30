import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_images.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/ui/widgets/custom_button.dart';
import 'package:soilpredictor/feature/home/ui/screens/inputs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 250),
              Image.asset(AppImages.logo, width: 150, height: 150),
              const SizedBox(height: 20),

             
              SizedBox(height: 5),
              Text(
                'Welcome to Soil Predictor !',
                style: AppTextStyles.quicksand18BoldB(
                  color: AppColors.primary,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Predict the type of soil based on your camera input or image upload from your gallery.',
                textAlign: TextAlign.center,
                style: AppTextStyles.poppins12Regular(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 40),
              CustomButton(
                title: 'Get Started',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
