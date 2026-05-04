import 'package:flutter/material.dart';
import 'add_product_screen.dart'; // سطر الاستدعاء الجديد

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
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
              
              // زرار إضافة منتج (تم تعديله عشان يفتح الشاشة)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAA520),
                    foregroundColor: const Color(0xFF000080),
                  ),
                  onPressed: () {
                    // الكود ده هو اللي بينقل للشاشة الجديدة
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

              // زرار إدارة المنتجات الحالية (هنسيبه زي ما هو دلوقتي)
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