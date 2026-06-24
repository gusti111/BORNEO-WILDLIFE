import 'package:flutter/material.dart';

import 'app_colors.dart';

class IUCNHelper {
  // Warna utama status
  static Color getColor(String status) {
    if (status.contains("CR")) {
      return AppColors.critical;
    } else if (status.contains("EN")) {
      return AppColors.endangered;
    } else if (status.contains("VU")) {
      return AppColors.vulnerable;
    } else if (status.contains("NT")) {
      return AppColors.nearThreatened;
    } else {
      return AppColors.leastConcern;
    }
  }

  // Warna background badge
  static Color getBackgroundColor(String status) {
    return getColor(status).withValues(alpha: 0.15);
  }

  // Kode singkat
  static String getCode(String status) {
    if (status.contains("CR")) {
      return "CR";
    } else if (status.contains("EN")) {
      return "EN";
    } else if (status.contains("VU")) {
      return "VU";
    } else if (status.contains("NT")) {
      return "NT";
    } else {
      return "LC";
    }
  }

  // Nama status dalam Bahasa Indonesia
  static String getName(String status) {
    if (status.contains("CR")) {
      return "Kritis";
    } else if (status.contains("EN")) {
      return "Terancam";
    } else if (status.contains("VU")) {
      return "Rentan";
    } else if (status.contains("NT")) {
      return "Hampir Terancam";
    } else {
      return "Risiko Rendah";
    }
  }

  // Emoji status
  static String getEmoji(String status) {
    if (status.contains("CR")) {
      return "🔴";
    } else if (status.contains("EN")) {
      return "🟠";
    } else if (status.contains("VU")) {
      return "🟡";
    } else if (status.contains("NT")) {
      return "🟢";
    } else {
      return "🔵";
    }
  }

  // Label lengkap untuk ditampilkan pada Badge (Contoh: "🔴 CR - Kritis")
  static String getLabel(String status) {
    return "${getEmoji(status)} ${getCode(status)} - ${getName(status)}";
  }
}
