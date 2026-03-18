import 'package:flutter/material.dart';
import 'layout/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Sales Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB), // Blue primary
          brightness: Brightness.light,
          surface: Colors.white,
          background: const Color(0xFFF3F4F6), // Light gray background
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Default font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppLayout(),
      },
    );
  }
}
