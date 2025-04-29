import 'package:flutter/material.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';
import 'package:soilpredictor/core/helpers/app_text_styles.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    this.radio,
    this.hintText,
    this.prefixIcon,
    this.labelText,
    this.suffixIcon,
    this.isObsecureText,
    this.controller,
    this.validator,
  });
  double? radio;
  String? hintText;
  Widget? prefixIcon;
  String? labelText;
  Widget? suffixIcon;
  bool? isObsecureText;
  TextEditingController? controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObsecureText ?? false,
      style: AppTextStyles.poppins14Regular(),
      cursorColor: AppColors.primary,

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: AppTextStyles.poppins14Regular(color: AppColors.grey),
        hintStyle: AppTextStyles.poppins14Regular(color: AppColors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
         border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red, width: 1.5),
        ),
        //fillColor: AppColors.white,
      ),
    );
  }
}
