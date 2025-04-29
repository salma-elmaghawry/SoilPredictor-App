import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';
import 'package:soilpredictor/core/widgets/custom_button.dart';
import 'package:soilpredictor/core/widgets/custom_input.dart';
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      for (int i = 0; i < controllers.length; i++) {
        print('${labels[i]}: ${controllers[i].text}');
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UploadScreen()),
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
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter a value';
                      //   }
                      //   return null;
                      // },
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
