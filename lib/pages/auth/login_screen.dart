import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_colors.dart';
import '../home_page.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // FUNGSI AUTENTIKASI INTI
  Future<void> _processLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();

    // Menarik data yang disimpan saat registrasi
    final savedUsername = prefs.getString('reg_username');
    final savedEmail = prefs.getString('reg_email');
    final savedPassword = prefs.getString('reg_password');

    final inputId = _identifierController.text;
    final inputPass = _passwordController.text;

    // Logika Komparasi: Cek apakah kredensial cocok
    bool isUserValid = (inputId == savedUsername || inputId == savedEmail);
    bool isPasswordValid = (inputPass == savedPassword);

    if (context.mounted) {
      if (isUserValid && isPasswordValid) {
        // Login Sukses
        if (_rememberMe) {
          await prefs.setBool('is_logged_in', true);
        }
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        // Login Gagal
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login gagal! Username/Email atau Password salah."),
            backgroundColor: AppColors.errorRed,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softGrey,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.park_rounded,
                  size: 80,
                  color: AppColors.forestGreen,
                ),
                const SizedBox(height: 16),
                const Text(
                  "BORNEO WILDLIFE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.forestGreen,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const Text(
                  "Explore • Learn • Protect",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.earthBrown,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 40),

                TextFormField(
                  controller: _identifierController,
                  decoration: InputDecoration(
                    labelText: "Username or Email",
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.forestGreen,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.forestGreen,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Input tidak boleh kosong"
                      : null,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.forestGreen,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.forestGreen,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Password tidak boleh kosong"
                      : null,
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          activeColor: AppColors.forestGreen,
                          onChanged: (value) =>
                              setState(() => _rememberMe = value ?? false),
                        ),
                        const Text(
                          "Remember Me",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      ),
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColors.mossGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.forestGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  onPressed: _processLogin, // Eksekusi validasi disini
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun? ",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      ),
                      child: const Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                          color: AppColors.forestGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
