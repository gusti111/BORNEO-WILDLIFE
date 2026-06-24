import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.forestGreen),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Bergabung Bersama Kami!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.forestGreen,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Lengkapi profil untuk ikut serta melindungi alam Borneo.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 30),

                // UI Foto Profil
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.mossGreen.withValues(
                          alpha: 0.2,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: AppColors.forestGreen,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Fitur pilih foto segera hadir!"),
                              ),
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.forestGreen,
                            radius: 18,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                _buildTextField(
                  _fullNameController,
                  "Nama Lengkap",
                  Icons.badge_outlined,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  _usernameController,
                  "Username",
                  Icons.alternate_email,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  _emailController,
                  "Email",
                  Icons.email_outlined,
                  isEmail: true,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  _cityController,
                  "Kota / Asal Daerah",
                  Icons.location_city_rounded,
                ),
                const SizedBox(height: 16),

                // Form Password
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
                  validator: (value) => (value == null || value.length < 6)
                      ? "Password minimal 6 karakter"
                      : null,
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.forestGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // PENYIMPANAN DATA REGISTRASI
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(
                        'reg_name',
                        _fullNameController.text,
                      );
                      await prefs.setString(
                        'reg_username',
                        _usernameController.text,
                      );
                      await prefs.setString('reg_email', _emailController.text);
                      await prefs.setString('reg_city', _cityController.text);
                      await prefs.setString(
                        'reg_password',
                        _passwordController.text,
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Registrasi Berhasil! Silakan Login.",
                            ),
                            backgroundColor: AppColors.successGreen,
                          ),
                        );
                        Navigator.pop(context); // Kembali ke halaman Login
                      }
                    }
                  },
                  child: const Text(
                    "DAFTAR SEKARANG",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.forestGreen),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.forestGreen, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? "$label wajib diisi" : null,
    );
  }
}
