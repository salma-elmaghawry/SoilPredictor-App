import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:soilpredictor/feature/home/data/api_service.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_response_model.dart';


part 'soil_predictor_state.dart';

class SoilPredictorCubit extends Cubit<SoilPredictorState> {
  final ApiService apiService;

  SoilPredictorCubit({required this.apiService})
    : super(SoilPredictorInitial());

  Future<void> analyzeSoil(SoilAnalysisRequest request) async {
    emit(SoilPredictorLoading());

    try {
      final response = await apiService.analyzeSoil(request);
      emit(SoilPredictorSuccess(response));
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data?['message'] ?? e.message ?? 'Failed to analyze soil';
      emit(SoilPredictorError(errorMessage));
    } catch (e) {
      emit(
        SoilPredictorError(
          e is String ? e : 'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }
}
