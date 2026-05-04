import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // استدعاء شاشة تسجيل الدخول الجديدة

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primaryColor: const Color(0xFF000080),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000080),
          foregroundColor: Color(0xFFFFD700),
          centerTitle: true,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F8FF),
      ),
      home: const LoginScreen(), // خلينا شاشة البداية هي تسجيل الدخول
    );
  }
}