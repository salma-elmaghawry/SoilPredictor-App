part of 'soil_predictor_cubit.dart';

@immutable
sealed class SoilPredictorState {}

final class SoilPredictorInitial extends SoilPredictorState {}

class SoilPredictorLoading extends SoilPredictorState {
  final String message;
  
  SoilPredictorLoading({this.message = "Analyzing soil..."});
}

class SoilPredictorSuccess extends SoilPredictorState {
  final SoilAnalysisResponse response;

  SoilPredictorSuccess(this.response);
}

class SoilPredictorError extends SoilPredictorState {
  final String message;

  SoilPredictorError(this.message);
}
