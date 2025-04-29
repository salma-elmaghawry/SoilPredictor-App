import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_images.dart';
import 'package:soilpredictor/core/widgets/build_option_card.dart';
import 'dart:io';

import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';
import 'package:soilpredictor/feature/home/domain/cubit/soil_predictor_cubit.dart';
import 'package:soilpredictor/feature/home/ui/result_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final imageFile = File(pickedFile.path);

        final request = SoilAnalysisRequest(
          file: imageFile,
          n: 0, // Your default values
          p: 0,
          k: 0,
          pH: 0,
          ec: 0,
          oc: 0,
          s: 0,
          zn: 0,
          fe: 0,
          cu: 0,
          mn: 0,
          b: 0,
        );

        await context.read<SoilPredictorCubit>().analyzeSoil(request);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ResultScreen(fertilityLevel: 0)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Back Button
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: AppColors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const SizedBox(height: 80),

              // Upload Image Card
              Center(
                child: buildOptionCard(
                  context,
                  assetImage: AppImages.photo,
                  text: 'Upload the soil image\nyou want to process',
                  onTap: () => _pickImage(context, ImageSource.gallery),
                ),
              ),
              const SizedBox(height: 40),

              // Take Picture Card
              Center(
                child: buildOptionCard(
                  context,
                  assetImage: AppImages.camera,
                  text: 'Take a picture of the soil',
                  onTap: () => _pickImage(context, ImageSource.camera),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
