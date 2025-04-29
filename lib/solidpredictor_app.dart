import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/routes/app_router.dart';
import 'package:soilpredictor/feature/home/data/api_service.dart';
import 'package:soilpredictor/feature/home/domain/cubit/soil_predictor_cubit.dart';

class SoilpredictorApp extends StatelessWidget {
  const SoilpredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SoilPredictorCubit(apiService: ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: AppRouter.home,
      ),
    );
  }
}
