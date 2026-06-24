import 'package:flutter/material.dart';

import '../data/satwa_data.dart';
import '../widgets/satwa_grid_item.dart';
import 'detail_page.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid View Satwa")),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: daftarSatwa.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

            // Jarak antar card
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,

            // Diperbarui ke 0.75 untuk mencegah overflow setelah penambahan nama ilmiah
            childAspectRatio: 0.75,
          ),

          itemBuilder: (context, index) {
            final satwa = daftarSatwa[index];

            return SatwaGridItem(
              satwa: satwa,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(satwa: satwa)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
