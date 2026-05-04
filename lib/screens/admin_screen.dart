import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // مكتبة الحسابات عشان الخروج
import 'add_product_screen.dart';
import 'login_screen.dart'; // عشان نقدر نرجع لشاشة الدخول

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          // زرار تسجيل الخروج الجديد
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // بنعمل تسجيل خروج من السيرفر الأول
              await FirebaseAuth.instance.signOut();
              // بنقفل شاشة المدير ونفتح شاشة الدخول
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.admin_panel_settings, size: 100, color: Color(0xFF000080)),
              const SizedBox(height: 20),
              const Text(
                'Manager Control Panel',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
              ),
              const SizedBox(height: 40),
              
              // زرار إضافة منتج
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAA520),
                    foregroundColor: const Color(0xFF000080),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddProductScreen()),
                    );
                  },
                  icon: const Icon(Icons.add_box),
                  label: const Text('Add New Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // زرار إدارة المنتجات الحالية
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF000080),
                    foregroundColor: const Color(0xFFDAA520),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Manage Products Screen will open here')),
                    );
                  },
                  icon: const Icon(Icons.edit_document),
                  label: const Text('Manage Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}