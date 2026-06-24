import 'package:flutter/material.dart';

import '../models/satwa_model.dart';
import '../widgets/category_chip.dart';
import '../widgets/info_card.dart';
import '../widgets/status_badge.dart';
import '../widgets/section_title.dart';

class DetailPage extends StatelessWidget {
  final Satwa satwa;

  const DetailPage({super.key, required this.satwa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(satwa.nama),
      ), // Menampilkan nama satwa di AppBar

      body: SingleChildScrollView(
        // Padding dihapus dari sini agar gambar bisa membentang penuh
        child: Column(
          children: [
            // HERO IMAGE (Gambar Full Width di Atas)
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                satwa.imageAsset,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                // Penanganan error jika gambar belum diunduh / path salah
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            // KONTEN INFORMASI (Dibungkus Padding agar rapi)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Nama
                  Text(
                    satwa.nama,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  const SizedBox(height: 4),

                  // Nama Ilmiah
                  Text(
                    satwa.namaIlmiah,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Badge Kategori dan Status
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      CategoryChip(kategori: satwa.kategori),

                      StatusBadge(statusIUCN: satwa.statusIUCN),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Informasi Utama
                  InfoCard(
                    icon: Icons.forest,
                    title: "Habitat",
                    value: satwa.habitat,
                    color: Colors.green,
                  ),

                  InfoCard(
                    icon: Icons.public,
                    title: "Persebaran",
                    value: satwa.persebaran,
                    color: Colors.blue,
                  ),

                  InfoCard(
                    icon: Icons.restaurant,
                    title: "Makanan",
                    value: satwa.makanan,
                    color: Colors.orange,
                  ),

                  InfoCard(
                    icon: Icons.groups,
                    title: "Estimasi Populasi",
                    value: satwa.estimasiPopulasi,
                    color: Colors.purple,
                  ),

                  const SizedBox(height: 20),

                  // Deskripsi
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(
                            title: "Deskripsi",
                            icon: Icons.menu_book,
                            color: Colors.green,
                          ),

                          const SizedBox(height: 10),

                          Text(
                            satwa.deskripsi,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Fakta Menarik
                  Card(
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "💡 Fakta Menarik",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),

                          const SizedBox(height: 10),

                          Text(
                            satwa.faktaMenarik,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Footer Konservasi & Copyright
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Data konservasi berdasarkan IUCN Red List",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "© Borneo Wildlife Encyclopedia",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
