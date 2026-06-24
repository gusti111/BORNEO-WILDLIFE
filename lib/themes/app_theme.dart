import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Warna utama aplikasi
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.forestGreen,
        brightness: Brightness.light,
      ),

      // Warna latar belakang aplikasi
      scaffoldBackgroundColor: AppColors.softGrey,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.cardWhite,
        elevation: 3,
        shadowColor: AppColors.shadowColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.forestGreen,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mossGreen,
        foregroundColor: Colors.white,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(color: Colors.black12, thickness: 1),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.leafGreen.withValues(alpha: 0.15),
        selectedColor: AppColors.mossGreen,
        disabledColor: Colors.grey.shade300,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),

        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),

        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),

        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),

        bodyLarge: TextStyle(fontSize: 15, color: AppColors.textPrimary),

        bodyMedium: TextStyle(fontSize: 14, color: AppColors.textSecondary),

        bodySmall: TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
    );
  }
}
