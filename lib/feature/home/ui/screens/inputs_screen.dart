import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/feature/home/ui/widgets/custom_button.dart';
import 'package:soilpredictor/feature/home/ui/screens/upload_screen.dart';
import 'package:soilpredictor/feature/home/ui/widgets/soil_input_fields.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  final _formKey = GlobalKey<FormState>();
  final SoilInputFields _inputFields = SoilInputFields();

  @override
  void dispose() {
    _inputFields.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadScreen(request: _inputFields.createRequest()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter Soil Values',
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
              ...List.generate(
                (_inputFields.fieldData.length / 2).ceil(),
                (rowIndex) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _inputFields.buildInputField(
                          context, 
                          _inputFields.fieldData[rowIndex * 2],
                        ),
                      ),
                      const SizedBox(width: 16),
                      if (rowIndex * 2 + 1 < _inputFields.fieldData.length)
                        Expanded(
                          child: _inputFields.buildInputField(
                            context, 
                            _inputFields.fieldData[rowIndex * 2 + 1],
                          ),
                        ),
                    ],
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