import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Pembuatan Variabel Yang Akan Dipakai untuk menangkap input user
  TextEditingController inputNama = TextEditingController();
  TextEditingController inputKataSandi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2373F4),
      // Menggunakan SingleChildScrollView agar layar bisa di-scroll dan menghindari error overflow saat keyboard muncul
      body: SingleChildScrollView( 
        child: Column(
          children: [
            // Kontainer untuk menampilkan gambar logo/asset
            Container(
              child: const Image(
                image: AssetImage('asset/image/image.png'),
                width: 300,
                height: 300,
              ),
            ),
            
            // Input Field untuk Nama Pengguna
            Center(
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Masukan Nama Pengguna',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  controller: inputNama, // Menghubungkan input dengan variabel inputNama
                ),
              ),
            ),
            
            // Jarak antar widget
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            
            // Input Field untuk Kata Sandi
            Center(
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  obscureText: true, // Fitur keamanan agar teks kata sandi disamarkan (menjadi titik/bintang)
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Masukan Kata Sandi',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  controller: inputKataSandi, // Menghubungkan input dengan variabel inputKataSandi
                ),
              ),
            ),
            
            // Jarak antar widget
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            
            // Tombol Kirim / Login
            ElevatedButton(
              child: const Text("Kirim"),
              onPressed: () {
                // 1. Ambil teks dari controller dan cek apakah cocok dengan data kredensial
                // Ganti 'admin' dan '123' sesuai dengan username & password yang Anda inginkan
                if (inputNama.text == 'User' && inputKataSandi.text == '1234') {
                  
                  // 2. JIKA BENAR: Cetak status di log debug dan pindah ke halaman utama (/home)
                  print("Login Berhasil");
                  Navigator.pushReplacementNamed(context, "/home");
                  
                } else {
                  
                  // 3. JIKA SALAH: Cetak status di log debug dan tampilkan notifikasi error di layar
                  print("Login Gagal");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama pengguna atau kata sandi tidak boleh kosong!'),
                      backgroundColor: Colors.red, // Mengubah warna notifikasi menjadi merah sebagai tanda error
                    ),
                  );
                  
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
