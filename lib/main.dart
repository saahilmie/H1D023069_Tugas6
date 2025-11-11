import 'package:flutter/material.dart';
import 'ui/form_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6 Pertemuan 8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IndieFlower',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD9B8FF)),
        useMaterial3: true,
      ),
      home: const FormDataPage(),
    );
  }
}
