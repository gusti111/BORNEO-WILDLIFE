import 'package:flutter/material.dart';

import '../models/satwa_model.dart';
import 'status_badge.dart';

class SatwaGridItem extends StatelessWidget {
  final Satwa satwa;
  final VoidCallback? onTap;

  const SatwaGridItem({super.key, required this.satwa, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      // clipBehavior memastikan gambar terpotong rapi mengikuti sudut lengkung Card
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian Atas: Gambar Satwa
            Expanded(
              flex: 5,
              child: Image.asset(
                satwa.imageAsset,
                fit: BoxFit.cover,
                // errorBuilder berjaga-jaga jika path gambar salah atau file belum dimasukkan
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),

            // Bagian Bawah: Informasi Satwa
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      satwa.nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      satwa.namaIlmiah,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 4),
                    StatusBadge(statusIUCN: satwa.statusIUCN),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
