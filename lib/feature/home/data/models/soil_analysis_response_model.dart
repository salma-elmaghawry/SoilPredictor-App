class SoilAnalysisResponse {
  final String soilType;
  final double soilTypeProbability;
  final String fertility;

  SoilAnalysisResponse({
    required this.soilType,
    required this.soilTypeProbability,
    required this.fertility,
  });

  factory SoilAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return SoilAnalysisResponse(
      soilType: json['soil_type'] as String,
      soilTypeProbability: (json['soil_type_probability'] as num).toDouble(),
      fertility: json['fertility'] as String,
    );
  }
}