import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/data/models/soil_analysis_request_model.dart';

class SoilInputFields {
  final List<TextEditingController> controllers = List.generate(
    12,
    (_) => TextEditingController(),
  );

  final List<Map<String, dynamic>> fieldData = [
    {
      'label': 'NH₄',
      'index': 0,
      'type': 'double',
      'range': 'Range: 0.1 - 100 mg/kg',
      'min': 0.1,
      'max': 100.0,
    },
    {
      'label': 'P',
      'index': 1,
      'type': 'int',
      'range': 'Range: 1 - 100 mg/kg',
      'min': 1,
      'max': 100,
    },
    {
      'label': 'K',
      'index': 2,
      'type': 'int',
      'range': 'Range: 10 - 500 mg/kg',
      'min': 10,
      'max': 500,
    },
    {
      'label': 'pH',
      'index': 3,
      'type': 'double',
      'range': 'Range: 3.0 - 10.0',
      'min': 3.0,
      'max': 10.0,
    },
    {
      'label': 'ec',
      'index': 4,
      'type': 'double',
      'range': 'Range: 0.1 - 5.0 dS/m',
      'min': 0.1,
      'max': 5.0,
    },
    {
      'label': 'OC',
      'index': 5,
      'type': 'int',
      'range': 'Range: 0 - 50 g/kg',
      'min': 0,
      'max': 50,
    },
    {
      'label': 'S',
      'index': 6,
      'type': 'int',
      'range': 'Range: 1 - 100 mg/kg',
      'min': 1,
      'max': 100,
    },
    {
      'label': 'Zn',
      'index': 7,
      'type': 'double',
      'range': 'Range: 0.1 - 10 mg/kg',
      'min': 0.1,
      'max': 10.0,
    },
    {
      'label': 'Fe',
      'index': 8,
      'type': 'double',
      'range': 'Range: 1 - 100 mg/kg',
      'min': 1.0,
      'max': 100.0,
    },
    {
      'label': 'Cu',
      'index': 9,
      'type': 'double',
      'range': 'Range: 0.1 - 10 mg/kg',
      'min': 0.1,
      'max': 10.0,
    },
    {
      'label': 'Mn',
      'index': 10,
      'type': 'double',
      'range': 'Range: 0.5 - 50 mg/kg',
      'min': 0.5,
      'max': 50.0,
    },
    {
      'label': 'B',
      'index': 11,
      'type': 'double',
      'range': 'Range: 0.1 - 5 mg/kg',
      'min': 0.1,
      'max': 5.0,
    },
  ];

  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
  }

  SoilAnalysisRequest createRequest() {
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

  String? _validateInput(String? value, Map<String, dynamic> field) {
    if (value == null || value.isEmpty) return 'Please enter a value';

    final type = field['type'] as String;
    final num? parsedValue =
        type == 'double' ? double.tryParse(value) : int.tryParse(value);

    if (parsedValue == null) return 'Please enter a valid number';

    final min = field['min'] as num;
    final max = field['max'] as num;

    if (parsedValue < min || parsedValue > max) {
      return 'Between $min and $max';
    }

    return null;
  }

  Widget buildInputField(BuildContext context, Map<String, dynamic> field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: AppColors.primary,
          controller: controllers[field['index'] as int],
          decoration: InputDecoration(
            hintText: field['label'] as String,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),

          keyboardType: TextInputType.number,
          validator: (value) => _validateInput(value, field),
        ),
        const SizedBox(height: 4),
        Text(
          field['range'] as String,
          style: AppTextStyles.poppins12Regular(color: Colors.grey),
        ),
      ],
    );
  }
}
