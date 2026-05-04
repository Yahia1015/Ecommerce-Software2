import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // استدعاء مكتبة فايربيز الأساسية
import 'firebase_options.dart'; // استدعاء ملف الربط اللي لسه نازل
import 'screens/login_screen.dart';

// خلينا الـ main تكون Future وتحتوي على async عشان تستنى فايربيز يحمل
void main() async { 
  WidgetsFlutterBinding.ensureInitialized(); // سطر تأكيد تشغيل فلاتر قبل فايربيز
  
  // سطر تشغيل فايربيز باستخدام إعدادات مشروعنا
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
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
      home: const LoginScreen(), 
    );
  }
}