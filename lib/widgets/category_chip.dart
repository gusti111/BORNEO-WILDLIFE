import 'package:flutter/material.dart';

import '../utils/category_helper.dart';

class CategoryChip extends StatelessWidget {
  final String kategori;

  const CategoryChip({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: CategoryHelper.getBackgroundColor(kategori),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CategoryHelper.getIcon(kategori),
            size: 14,
            color: CategoryHelper.getColor(kategori),
          ),

          const SizedBox(width: 5),

          Text(
            kategori,
            style: TextStyle(
              color: CategoryHelper.getColor(kategori),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
