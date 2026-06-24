import 'package:flutter/material.dart';

import '../utils/iucn_helper.dart';

class StatusBadge extends StatelessWidget {
  final String statusIUCN;

  const StatusBadge({super.key, required this.statusIUCN});

  @override
  Widget build(BuildContext context) {
    // Mengambil warna dan label dinamis langsung dari Helper
    Color backgroundColor = IUCNHelper.getBackgroundColor(statusIUCN);
    Color textColor = IUCNHelper.getColor(statusIUCN);
    String label = IUCNHelper.getLabel(statusIUCN);

    // Penyesuaian khusus: Gelapkan sedikit teks Vulnerable (Kuning) agar kontras dan mudah dibaca
    if (statusIUCN.contains("VU")) {
      textColor = Colors.orange.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize:
              11, // Dikecilkan sedikit dari 12 menjadi 11 agar muat untuk teks yang lebih panjang
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
