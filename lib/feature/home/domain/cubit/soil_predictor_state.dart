part of 'soil_predictor_cubit.dart';

@immutable
sealed class SoilPredictorState {}

final class SoilPredictorInitial extends SoilPredictorState {}
final class SoilPredictorLoading extends SoilPredictorState {}
final class SoilPredictorSuccess extends SoilPredictorState {
  final SoilAnalysisResponse response;

  SoilPredictorSuccess(this.response);
}
final class SoilPredictorError extends SoilPredictorState {
  final String error;

  SoilPredictorError(this.error);
}
