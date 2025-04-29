import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/routes/app_router.dart';


class SoilpredictorApp extends StatelessWidget {
  const SoilpredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: AppRouter.home,
    );
  }
}
