import 'package:flutter/material.dart';

class AppColors {
  // Mencegah instansiasi class (Best Practice untuk Utility Class)
  AppColors._();

  // ===== Primary Colors (Tema Alam) =====
  static const Color forestGreen = Color(0xFF1B5E20);
  static const Color mossGreen = Color(0xFF4CAF50);
  static const Color leafGreen = Color(0xFF81C784);

  // ===== Background Colors =====
  static const Color creamWhite = Color(0xFFFFF8E1);
  static const Color softGrey = Color(0xFFF5F5F5);
  static const Color cardWhite = Colors.white;
  static const Color transparent =
      Colors.transparent; // Sentralisasi warna transparan untuk AppBar

  // ===== Earth & Water Colors =====
  static const Color earthBrown = Color(0xFF795548);
  static const Color woodBrown = Color(0xFFA1887F);
  static const Color riverBlue = Color(0xFF42A5F5);

  // ===== Semantic & Form Colors (BARU) =====
  static const Color errorRed = Color(0xFFD32F2F); // Untuk validasi form gagal
  static const Color successGreen = Color(
    0xFF388E3C,
  ); // Untuk notifikasi sukses
  static const Color borderGrey = Color(0xFFE0E0E0); // Garis tepi input field

  // ===== Status IUCN =====
  static const Color critical = Color(0xFFD32F2F); // CR
  static const Color endangered = Color(0xFFF57C00); // EN
  static const Color vulnerable = Color(0xFFFBC02D); // VU
  static const Color nearThreatened = Color(0xFF388E3C); // NT
  static const Color leastConcern = Color(0xFF1976D2); // LC

  // ===== Text Colors =====
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Colors.white;

  // ===== Shadow =====
  static const Color shadowColor = Color(0x1A000000);
}
