import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const SectionTitle({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color, size: 20),
        ),

        const SizedBox(width: 10),

        Expanded(child: Text(title, style: AppTextStyles.sectionTitle)),
      ],
    );
  }
}
