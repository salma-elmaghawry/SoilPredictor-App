// result_screen.dart
import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_images.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/ui/widgets/custom_button.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_response_model.dart';
import 'package:soilpredictor/feature/home/ui/screens/inputs_screen.dart';

class ResultScreen extends StatelessWidget {
  final SoilAnalysisResponse response;

  const ResultScreen({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFertile = false;
    String status = response.fertility;
    if (status == "Suitable for cultivation") {
      isFertile = true;
    } else if (status == "Not suitable for cultivation") {
      isFertile = false;
    } else {
      isFertile = false;
    }

    final imagePath = isFertile ? AppImages.sucess : AppImages.fail;
    //final fertilityText = isFertile ? "Fertile" : "Not Fertile";
    final fertilityColor = isFertile ? AppColors.primary : AppColors.red;
    //final messageTitle = isFertile ? "Congratulations!" : "Unfortunately";
    final submittedMessage = isFertile ? "Ok Good!" : "Try again";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  'Soil Analysis Results',
                  style: AppTextStyles.quicksand18BoldB(
                    color: AppColors.primary,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: 290,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Soil Type: ",
                              style: AppTextStyles.quicksand18BoldB(
                                color: AppColors.primary,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: response.soilType,
                              style: AppTextStyles.quicksand18BoldB(
                                color: AppColors.textPrimary,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Fertility:",
                        style: AppTextStyles.quicksand18BoldB(
                          color: AppColors.primary,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 15),

                      Text(
                        response.fertility,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.quicksand18BoldB(
                          color: fertilityColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: 290,
                  title: submittedMessage,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
