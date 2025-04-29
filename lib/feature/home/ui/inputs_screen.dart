// inputs_screen.dart
import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/core/widgets/custom_button.dart';
import 'package:soilpredictor/core/widgets/custom_input.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';
import 'package:soilpredictor/feature/home/ui/upload_screen.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<String> labels = [
    '(NH₄) : Nitrogen',
    '(P) : Phosphorus',
    '(K) : Potassium',
    '(pH) : Soil Acidity',
    '(ec) : Electrical Conductivity',
    '(OC) : Organic Carbon',
    '(S) : Sulfur',
    '(Zn) : Zinc',
    '(Fe) : Iron',
    '(Cu) : Copper',
    '(Mn) : Manganese',
    '(B) : Boron',
  ];

  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      labels.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  SoilAnalysisRequest _createRequest() {
    return SoilAnalysisRequest(
      n: double.tryParse(controllers[0].text) ?? 0,
      p: int.tryParse(controllers[1].text) ?? 0,
      k: int.tryParse(controllers[2].text) ?? 0,
      pH: double.tryParse(controllers[3].text) ?? 0,
      ec: double.tryParse(controllers[4].text) ?? 0,
      oc: int.tryParse(controllers[5].text) ?? 0,
      s: int.tryParse(controllers[6].text) ?? 0,
      zn: double.tryParse(controllers[7].text) ?? 0,
      fe: double.tryParse(controllers[8].text) ?? 0,
      cu: double.tryParse(controllers[9].text) ?? 0,
      mn: double.tryParse(controllers[10].text) ?? 0,
      b: double.tryParse(controllers[11].text) ?? 0,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final request = _createRequest();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadScreen(request: request),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter Soil ingredients values',
          style: AppTextStyles.poppins16Regular(fontSize: 20),
        ),
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: labels.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return CustomInput(
                      controller: controllers[index],
                      hintText: labels[index],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(title: "Continue", onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}