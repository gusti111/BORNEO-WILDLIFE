import 'package:flutter/material.dart';

import '../models/satwa_model.dart';
import 'category_chip.dart';
import 'status_badge.dart';

class SatwaListItem extends StatelessWidget {
  final Satwa satwa;
  final VoidCallback? onTap;

  const SatwaListItem({super.key, required this.satwa, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mengganti CircleAvatar dengan Image Asset berbentuk Rounded Rectangle
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  satwa.imageAsset,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                  // Berjaga-jaga jika gambar belum ada atau path salah
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 100,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      satwa.nama,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Text(
                      satwa.namaIlmiah,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Diubah menjadi Wrap agar aman dari overflow di HP layar kecil
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        CategoryChip(kategori: satwa.kategori),
                        StatusBadge(statusIUCN: satwa.statusIUCN),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Tambahan Deskripsi Singkat (Maks 2 baris)
                    Text(
                      satwa.deskripsi,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 4),

                        Expanded(
                          child: Text(
                            satwa.persebaran,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(Icons.groups, size: 16, color: Colors.grey),

                        const SizedBox(width: 4),

                        Expanded(
                          child: Text(
                            satwa.estimasiPopulasi,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
