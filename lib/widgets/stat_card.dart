import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          // Padding dikurangi agar proporsional sebagai header
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20, // Radius diperkecil
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(
                  icon,
                  color: color,
                  size: 22,
                ), // Ukuran ikon disesuaikan
              ),

              const SizedBox(height: 8), // Jarak vertikal dikurangi

              Text(
                value,
                // Mengurangi sedikit ukuran font default agar sesuai dengan kartu yang lebih kecil
                style: AppTextStyles.statValue.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 4),

              Text(
                label,
                style: AppTextStyles.statLabel,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
