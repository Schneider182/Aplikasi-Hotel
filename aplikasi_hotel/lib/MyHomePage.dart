import 'package:flutter/material.dart';
// Pastikan untuk mengimpor file TampilkanPage Anda di sini, contoh:
// import 'tampilkan_page.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Pembuatan Variabel Yang Akan Dipakai
  TextEditingController inputNama = TextEditingController();

  @override
  void dispose() {
    inputNama.dispose(); // Best practice: dispose controller saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel"),
        backgroundColor: const Color.fromARGB(0, 50, 145, 145),
      ),
      backgroundColor: const Color(0xFF2373F4),
      body: Column(
        children: [
          const SizedBox(height: 20), // Memberikan sedikit jarak dari AppBar ke input field
          Center(
            child: SizedBox(
              width: 300,
              child: TextFormField(
                // Dekorasi untuk TextFormField
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Masukan Nama Kamu',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                // controller untuk menangkap input nama
                controller: inputNama,
                // Ketika user menekan tombol 'Enter'/'Done' pada keyboard ponsel
                onFieldSubmitted: (values) {
                  inputNama.text = values;
                },
              ),
            ),
          ),
        ],
      ),
      // Menambahkan FloatingActionButton di sini
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mengambil nilai dari inputNama dan mengirimkannya ke halaman TampilkanPage
          String nama = inputNama.text.trim();
          if (nama.isNotEmpty) {
            Navigator.pushNamed(
              context,
              '/tampilkan',
              arguments: nama, // Mengirimkan nama sebagai argumen
            );
          } else {
            // Menampilkan snackbar jika input kosong
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nama tidak boleh kosong!')),
            );
          }
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
    );
  }
}