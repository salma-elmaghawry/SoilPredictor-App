import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_images.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/ui/widgets/build_option_card.dart';
import 'package:soilpredictor/feature/home/ui/widgets/show_dialog.dart';
import 'dart:io';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';
import 'package:soilpredictor/feature/home/domain/cubit/soil_predictor_cubit.dart';
import 'package:soilpredictor/feature/home/ui/screens/result_screen.dart';

class UploadScreen extends StatelessWidget {
  final SoilAnalysisRequest request;

  const UploadScreen({Key? key, required this.request}) : super(key: key);

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final imageFile = File(pickedFile.path);
        final completeRequest = request.copyWith(file: imageFile);

        context.read<SoilPredictorCubit>().analyzeSoil(completeRequest);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SoilPredictorCubit, SoilPredictorState>(
      listener: (context, state) {
        if (state is SoilPredictorSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ResultScreen(response: state.response),
            ),
          );
        } else if (state is SoilPredictorError) {
          showdialog(context, state);
        }
      },
      child: Scaffold(
        body: BlocBuilder<SoilPredictorCubit, SoilPredictorState>(
          builder: (context, state) {
            // Show loading indicator when state is SoilPredictorLoading
            if (state is SoilPredictorLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(AppImages.logo, width: 200, height: 200),
                    const SizedBox(height: 30),
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.message,
                      style: AppTextStyles.quicksand20BoldB(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            return SafeArea(
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
                    Center(
                      child: buildOptionCard(
                        context,
                        assetImage: AppImages.photo,
                        text: 'Upload the soil image\nyou want to process',
                        onTap: () => pickImage(context, ImageSource.gallery),
                      ),
                    ),
                  const SizedBox(height: 40),
                    Center(
                      child: buildOptionCard(
                        context,
                        assetImage: AppImages.camera,
                        text: 'Take a picture of the soil',
                        onTap: () => pickImage(context, ImageSource.camera),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
