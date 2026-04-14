import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Text Styles using Noto Sans Arabic
class AppTextStyle {
  // Prevent instantiation
  AppTextStyle._();

  /// Base helper for Noto Sans Arabic
  static TextStyle _elMessiri({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
  }) {
    return GoogleFonts.elMessiri(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  // GENERIC STYLE HELPERS
  static TextStyle setStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: height,
  );

  static TextStyle setWhite({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.white,
    height: height,
  );

  static TextStyle setPrimary({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.textPrimary,
    height: height,
  );

  static TextStyle setSecondary({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.textSecondary,
    height: height,
  );

  static TextStyle setBrandPrimary({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.brandPrimary,
    height: height,
  );

  static TextStyle setBrandSecondary({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.brandSecondary,
    height: height,
  );

  static TextStyle setError({
    required double fontSize,
    required FontWeight fontWeight,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.error,
  );

  static TextStyle setSuccess({
    required double fontSize,
    required FontWeight fontWeight,
  }) => _elMessiri(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: AppColors.success,
  );
  // PREDEFINED DESIGN TOKENS
  static TextStyle get heading1 => _elMessiri(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get heading2 => _elMessiri(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get heading3 => _elMessiri(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyRegular => _elMessiri(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => _elMessiri(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle get bodySmall => _elMessiri(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  static TextStyle get caption => _elMessiri(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
  );

  static TextStyle get button => _elMessiri(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  // ONBOARDING SPECIFIC STYLES
  static TextStyle get onboardingTitle => _elMessiri(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static TextStyle get onboardingDescription => _elMessiri(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );
}
