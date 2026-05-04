import 'register_screen.dart';
import 'package:flutter/material.dart';
import 'products_screen.dart'; // عشان نقدر ننقله للمنتجات بعد ما يسجل دخول

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // اللوجو (أيقونة مؤقتة)
              const Icon(Icons.lock_person, size: 100, color: Color(0xFF000080)),
              const SizedBox(height: 20),
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
              ),
              const SizedBox(height: 40),
              
              // خانة الإيميل
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              
              // خانة الباسورد
              TextField(
                obscureText: true, // عشان تخفي الحروف
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),
              
              // زرار الدخول
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAA520), // اللون الذهبي
                    foregroundColor: const Color(0xFF000080), // اللون الكحلي
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // كود الانتقال لشاشة المنتجات لما يضغط على الزرار
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const BrowseProductsScreen()),
                    );
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              // الزرار اللي بينقلك لشاشة إنشاء حساب
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text(
                  'Don\'t have an account? Register Here',
                  style: TextStyle(color: Color(0xFF000080), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}