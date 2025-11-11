import 'package:flutter/material.dart';

class TampilDataPage extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilDataPage({
    super.key,
    required this.nama,
    required this.nim,
    required this.tahun,
  });

  @override
  Widget build(BuildContext context) {
    int umur = DateTime.now().year - tahun;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDE7F2), Color(0xFFF5E6FE)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Card(
            color: Colors.white.withValues(alpha: 0.9),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Perkenalan",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9E78CF),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Halo ges",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.purple.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Nama ku $nama \nNIM $nim",
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "dan umur aku $umur tahun",
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Kembali"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBFA2DB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
