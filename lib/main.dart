import 'package:flutter/material.dart';

import 'pages/home_page.dart';


void main() {
  runApp(const SentiKampusApp());
}


class SentiKampusApp extends StatelessWidget {
  const SentiKampusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SentiKampus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}