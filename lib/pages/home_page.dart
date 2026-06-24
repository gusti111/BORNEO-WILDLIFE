import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../data/satwa_data.dart';
import '../widgets/satwa_list_item.dart';
import '../widgets/stat_card.dart';
import 'detail_page.dart';
import 'grid_page.dart';
import 'auth/profile_screen.dart'; // IMPORT HALAMAN PROFIL DI SINI

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final kategoriSet = daftarSatwa.map((satwa) => satwa.kategori).toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.appName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Tambahan Subjudul (Prioritas 8)
            Text(
              "Ensiklopedia Satwa Endemik Kalimantan",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            // Tagline disesuaikan style-nya
            Text(
              AppStrings.appTagline,
              style: TextStyle(
                fontSize: 11,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        // TAMBAHAN: Tombol untuk menuju halaman Profil
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 28),
            tooltip: 'Profil Saya',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(width: 8), // Jarak margin kanan
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // Statistik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  StatCard(
                    icon: Icons.pets,
                    value: "${daftarSatwa.length}",
                    label: AppStrings.statAnimals,
                    color: Colors.green,
                  ),

                  const SizedBox(width: 10),

                  StatCard(
                    icon: Icons.category,
                    value: "${kategoriSet.length}",
                    label: AppStrings.statCategories,
                    color: Colors.orange,
                  ),

                  const SizedBox(width: 10),

                  const StatCard(
                    icon: Icons.public,
                    value: AppStrings.borneo,
                    label: AppStrings.statRegion,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Tombol Grid View
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.grid_view),
                  label: const Text(AppStrings.gridViewButton),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GridPage()),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            // List Satwa
            Expanded(
              child: ListView.builder(
                itemCount: daftarSatwa.length,
                itemBuilder: (context, index) {
                  final satwa = daftarSatwa[index];

                  return SatwaListItem(
                    satwa: satwa,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(satwa: satwa),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
