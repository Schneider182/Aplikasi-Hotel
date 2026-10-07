import 'package:flutter/material.dart';
import 'login.dart';
import 'myhomepage.dart';
import 'tampilkan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // Home bisa dikomentar atau dihapus
      // home: const Login(),
      routes: {
        // halaman utama awal aplikasi dibuka
        "/": (context) => const LoginPage(),
        // pengenalan rute ke halaman homepage
        "/home": (context) => const MyHomePage(),
        // pengenalan rute ke halaman tampilkan
        "/tampilkan": (context) => const TampilkanPage(),
      },
    );
  }
}