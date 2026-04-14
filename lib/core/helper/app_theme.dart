import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.n30,
    primaryColor: AppColors.primary500,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary500,
      secondary: AppColors.primary300,
      onPrimary: AppColors.white,
      error: AppColors.error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary500,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.heading1,
      displayMedium: AppTextStyle.heading2,
      displaySmall: AppTextStyle.heading3,
      bodyLarge: AppTextStyle.bodyRegular,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      labelLarge: AppTextStyle.button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,
        textStyle: AppTextStyle.button,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

