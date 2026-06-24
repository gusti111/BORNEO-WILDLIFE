import 'package:flutter/material.dart';

class Satwa {
  // =====================
  // IDENTITAS
  // =====================
  final int id;
  final String nama;
  final String namaIlmiah;
  final String kategori;

  // =====================
  // HABITAT & DISTRIBUSI
  // =====================
  final String habitat;
  final String persebaran;

  // =====================
  // BIOLOGI
  // =====================
  final String makanan;
  final String panjangTubuh;
  final String berat;
  final String umurHidup;

  // =====================
  // KONSERVASI
  // =====================
  final String statusIUCN;
  final String estimasiPopulasi;
  final String ancamanUtama;

  // =====================
  // INFORMASI TAMBAHAN
  // =====================
  final String deskripsi;
  final String faktaMenarik;

  // =====================
  // UI SUPPORT (VISUAL)
  // =====================
  final String imageAsset;
  final IconData icon;
  final Color warnaTema;

  const Satwa({
    required this.id,
    required this.nama,
    required this.namaIlmiah,
    required this.kategori,
    required this.habitat,
    required this.persebaran,
    required this.makanan,
    required this.panjangTubuh,
    required this.berat,
    required this.umurHidup,
    required this.statusIUCN,
    required this.estimasiPopulasi,
    required this.ancamanUtama,
    required this.deskripsi,
    required this.faktaMenarik,
    required this.imageAsset,
    required this.icon,
    required this.warnaTema,
  });

  // =====================
  // HELPERS (UNTUK UI)
  // =====================

  /// Ambil kode status: CR, EN, VU, NT, LC
  String get kodeStatus {
    if (statusIUCN.contains("CR")) return "CR";
    if (statusIUCN.contains("EN")) return "EN";
    if (statusIUCN.contains("VU")) return "VU";
    if (statusIUCN.contains("NT")) return "NT";
    return "LC";
  }

  /// Label status lengkap (untuk UI detail)
  String get statusLabel {
    switch (kodeStatus) {
      case "CR":
        return "Critically Endangered";
      case "EN":
        return "Endangered";
      case "VU":
        return "Vulnerable";
      case "NT":
        return "Near Threatened";
      default:
        return "Least Concern";
    }
  }

  /// Format populasi biar lebih natural
  String get populasiLabel {
    return "±$estimasiPopulasi";
  }

  /// Check apakah satwa kritis
  bool get isCritical => kodeStatus == "CR";

  /// Check apakah satwa terancam
  bool get isThreatened =>
      kodeStatus == "CR" || kodeStatus == "EN" || kodeStatus == "VU";
}
