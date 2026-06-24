import 'package:flutter/material.dart';

class CategoryHelper {
  // Icon kategori
  static IconData getIcon(String kategori) {
    switch (kategori) {
      case "Primata":
        return Icons.face;

      case "Mamalia":
        return Icons.pets;

      case "Karnivora":
        return Icons.cruelty_free;

      case "Burung":
        return Icons.flutter_dash;

      case "Mamalia Air":
      case "Ikan":
        return Icons.water;

      case "Reptil":
      case "Amfibi":
        return Icons.grass;

      default:
        return Icons.category;
    }
  }

  // Warna utama kategori
  static Color getColor(String kategori) {
    switch (kategori) {
      case "Primata":
        return Colors.orange;

      case "Mamalia":
        return Colors.brown;

      case "Karnivora":
        return Colors.red;

      case "Burung":
        return Colors.blue;

      case "Mamalia Air":
      case "Ikan":
        return Colors.cyan;

      case "Reptil":
      case "Amfibi":
        return Colors.green;

      default:
        return Colors.grey;
    }
  }

  // Background chip
  static Color getBackgroundColor(String kategori) {
    return getColor(kategori).withValues(alpha: 0.15);
  }

  // Emoji kategori
  static String getEmoji(String kategori) {
    switch (kategori) {
      case "Primata":
        return "🦧";

      case "Mamalia":
        return "🐻";

      case "Karnivora":
        return "🐆";

      case "Burung":
        return "🦜";

      case "Mamalia Air":
        return "🐬";

      case "Ikan":
        return "🐟";

      case "Reptil":
        return "🐊";

      case "Amfibi":
        return "🐸";

      default:
        return "🌿";
    }
  }

  // Label lengkap
  static String getLabel(String kategori) {
    return "${getEmoji(kategori)} $kategori";
  }
}
