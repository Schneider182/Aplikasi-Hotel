import 'package:flutter/material.dart';

class TampilkanPage extends StatelessWidget {
  const TampilkanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Mengambil data nama yang dikirim saat proses Navigator dari LoginPage
    // ModalRoute digunakan untuk menangkap argumen/data yang dilewati antar halaman
    final String namaPengguna = ModalRoute.of(context)?.settings.arguments as String? ?? 'Pengguna';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Warna latar belakang yang soft
      appBar: AppBar(
        title: const Text('Halaman Utama'),
        backgroundColor: const Color(0xFF2373F4), // Disamakan dengan tema LoginPage
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Menghilangkan tombol back bawaan AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Memposisikan widget di tengah vertikal
            children: [
              // Widget Icon sebagai pemanis tampilan
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Color(0xFF2373F4),
              ),
              const SizedBox(height: 16), // Jarak antar widget
              
              // Menampilkan teks sambutan beserta nama yang diinput
              const Text(
                'Selamat Datah kembali,',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                namaPengguna, // Variabel nama yang ditangkap dari LoginPage
                style: const TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 40), // Jarak sebelum tombol
              
              // Tombol untuk kembali ke halaman Login (Keluar)
              ElevatedButton.icon(
                icon: const Icon(Icons.logout), // Menambahkan icon keluar pada tombol
                label: const Text("Keluar / Kembali"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Mengubah warna tombol menjadi merah
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  // Kembali ke halaman Login dan menghapus history halaman utama
                  Navigator.pushReplacementNamed(context, "/home");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
