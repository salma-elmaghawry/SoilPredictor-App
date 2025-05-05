// inputs_screen.dart
import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/ui/widgets/custom_button.dart';
import 'package:soilpredictor/feature/home/ui/widgets/custom_input.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';
import 'package:soilpredictor/feature/home/ui/screens/upload_screen.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllers = List.generate(
    12,
    (_) => TextEditingController(),
  );

  final _fieldData = const [
    {'label': '(NH₄) : Nitrogen', 'index': 0, 'type': 'double'},
    {'label': '(P) : Phosphorus', 'index': 1, 'type': 'int'},
    {'label': '(K) : Potassium', 'index': 2, 'type': 'int'},
    {'label': '(pH) : Soil Acidity', 'index': 3, 'type': 'double'},
    {'label': '(ec) : Electrical Conductivity', 'index': 4, 'type': 'double'},
    {'label': '(OC) : Organic Carbon', 'index': 5, 'type': 'int'},
    {'label': '(S) : Sulfur', 'index': 6, 'type': 'int'},
    {'label': '(Zn) : Zinc', 'index': 7, 'type': 'double'},
    {'label': '(Fe) : Iron', 'index': 8, 'type': 'double'},
    {'label': '(Cu) : Copper', 'index': 9, 'type': 'double'},
    {'label': '(Mn) : Manganese', 'index': 10, 'type': 'double'},
    {'label': '(B) : Boron', 'index': 11, 'type': 'double'},
  ];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  SoilAnalysisRequest _createRequest() {
    return SoilAnalysisRequest(
      n: _parseValue(0, 'double'),
      p: _parseValue(1, 'int'),
      k: _parseValue(2, 'int'),
      pH: _parseValue(3, 'double'),
      ec: _parseValue(4, 'double'),
      oc: _parseValue(5, 'int'),
      s: _parseValue(6, 'int'),
      zn: _parseValue(7, 'double'),
      fe: _parseValue(8, 'double'),
      cu: _parseValue(9, 'double'),
      mn: _parseValue(10, 'double'),
      b: _parseValue(11, 'double'),
    );
  }

  dynamic _parseValue(int index, String type) {
    final text = controllers[index].text;
    return type == 'double'
        ? double.tryParse(text) ?? 0
        : int.tryParse(text) ?? 0;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadScreen(request: _createRequest()),
        ),
      );
    }
  }

  String? _validateInput(String? value, String type) {
    if (value == null || value.isEmpty) return 'Please enter a value';
    if ((type == 'double' ? double.tryParse(value) : int.tryParse(value)) ==
        null) {
      return 'Please enter a valid number';
    }
    return null;
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ..._fieldData.map(
                (field) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CustomInput(
                    controller: controllers[field['index'] as int],
                    hintText: field['label'] as String,
                    keyboardType: TextInputType.number,
                    validator:
                        (value) =>
                            _validateInput(value, field['type'] as String),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(title: "Continue", onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
