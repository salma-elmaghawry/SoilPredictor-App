// result_screen.dart
import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_images.dart';
import 'package:soilpredictor/core/widgets/custom_button.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_response_model.dart';

class ResultScreen extends StatelessWidget {
  final SoilAnalysisResponse response;

  const ResultScreen({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFertile = response.fertility.toLowerCase() == 'fertile';
    final imagePath = isFertile ? AppImages.sucess : AppImages.fail;
    final fertilityText = isFertile ? "Fertile" : "Not Fertile";
    final fertilityColor = isFertile ? AppColors.primary : AppColors.red;
    final messageTitle = isFertile ? "Congratulations!" : "Unfortunately";
    final submittedMessage = isFertile ? "Ok Good!" : "Try again";
    final messageDescription = isFertile
        ? "This soil is suitable for planting."
        : "This soil is not suitable for planting.";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  'Soil Analysis Results',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 30),
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

                      // Soil Type
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Soil Type: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: response.soilType,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Probability: ${(response.soilTypeProbability * 100).toStringAsFixed(2)}%',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Fertility Text
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Fertility: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: fertilityText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: fertilityColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Message Title
                      Text(
                        messageTitle,
                        style: TextStyle(
                          color: fertilityColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Description
                      Text(
                        messageDescription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
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
                    Navigator.popUntil(context, (route) => route.isFirst);
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