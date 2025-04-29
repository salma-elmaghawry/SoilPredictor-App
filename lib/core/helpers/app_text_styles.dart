import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilpredictor/core/helpers/app_colors.dart';

class AppTextStyles {
  static TextStyle quicksand24Bold({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle quicksand20Regular({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle quicksand20BoldW({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle quicksand20BoldB({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.textPrimary,
    );
  }

  static TextStyle quicksand18Regular({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 18,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle quicksand18BoldB({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 18,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.textPrimary,
    );
  }

  static TextStyle quicksand18BoldW({Color? color, double? fontSize}) {
    return GoogleFonts.quicksand(
      fontSize: fontSize ?? 18,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.white,
    );
  }

  static TextStyle poppins16Regular({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle poppins16Bold({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle poppins16SemiBoldButton({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle poppins14Regular({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle poppins14Bold({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle poppins12Regular({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle poppins12Bold({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle poppins12RegularUnderline({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primary,

      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }
}
