import 'package:flutter/material.dart';

import 'pages/auth/login_screen.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const BorneoWildlifeApp());
}

class BorneoWildlifeApp extends StatelessWidget {
  const BorneoWildlifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borneo Wildlife',
      debugShowCheckedModeBanner: false,

      // Menggunakan tema yang dipisah ke app_theme.dart
      theme: AppTheme.lightTheme,

      // Halaman awal aplikasi sekarang diarahkan ke Halaman Login
      home: const LoginScreen(),
    );
  }
}
