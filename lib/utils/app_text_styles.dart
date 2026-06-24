import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  // AppBar
  static const TextStyle appTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle appSubtitle = TextStyle(
    fontSize: 12,
    color: Colors.white70,
  );

  // Judul besar
  static const TextStyle headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Nama satwa
  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Nama ilmiah
  static const TextStyle scientificName = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    color: AppColors.textSecondary,
  );

  // Judul section
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Isi utama
  static const TextStyle body = TextStyle(
    fontSize: 15,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // Keterangan kecil
  static const TextStyle caption = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  // Statistik
  static const TextStyle statValue = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.forestGreen,
  );

  static const TextStyle statLabel = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  // Fun Fact
  static const TextStyle funFact = TextStyle(
    fontSize: 15,
    fontStyle: FontStyle.italic,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  // Badge
  static const TextStyle badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
