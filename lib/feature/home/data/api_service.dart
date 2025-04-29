import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:soilpredictor/core/helpers/app_constants.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_response_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    );
  }

 Future<SoilAnalysisResponse> analyzeSoil(SoilAnalysisRequest request) async {
  try {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        request.file.path,
        filename: 'soil_image.jpg',
      ),
      'N': request.n,
      'P': request.p,
      'K': request.k,
      'pH': request.pH,
      'EC': request.ec,
      'OC': request.oc,
      'S': request.s,
      'Zn': request.zn,
      'Fe': request.fe,
      'Cu': request.cu,
      'Mn': request.mn,
      'B': request.b,
    });

    final response = await _dio.post(
      '/predict',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
    
    return SoilAnalysisResponse.fromJson(response.data);
  } on DioException catch (e) {
    throw _handleDioError(e);
  } catch (e) {
    throw Exception('Failed to analyze soil: $e');
  }
}

  String _handleDioError(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      return e.response?.data['message'] ??
          e.response?.data['error'] ??
          e.message ??
          'Failed to analyze soil';
    }
    return e.message ?? 'Network error occurred';
  }
}
