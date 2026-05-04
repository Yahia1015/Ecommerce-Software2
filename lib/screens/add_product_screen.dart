import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // مكتبة الداتا بيز

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  // متحكمات الخانات
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  bool isLoading = false; // عشان نعمل علامة تحميل وقت الحفظ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.add_shopping_cart, size: 80, color: Color(0xFF000080)),
              const SizedBox(height: 20),
              
              // اسم المنتج
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),
              
              // السعر
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 15),

              // رابط الصورة
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: 'Image URL (Link)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),

              // زرار الحفظ
              SizedBox(
                width: double.infinity,
                height: 50,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator()) // لو بيحمل يظهر دايرة
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDAA520),
                          foregroundColor: const Color(0xFF000080),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () async {
                          // التأكد إن البيانات مش فاضية
                          if (nameController.text.isEmpty || priceController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please enter name and price'), backgroundColor: Colors.red),
                            );
                            return;
                          }

                          setState(() { isLoading = true; });

                          try {
                            // كود الإضافة الفعلي في قاعدة البيانات Firestore (في كوليكشن اسمه products)
                            await FirebaseFirestore.instance.collection('products').add({
                              'name': nameController.text.trim(),
                              'price': double.parse(priceController.text.trim()),
                              'imageUrl': imageController.text.trim().isEmpty 
                                  ? 'https://via.placeholder.com/150' // صورة افتراضية لو متكتبش رابط
                                  : imageController.text.trim(),
                              'createdAt': FieldValue.serverTimestamp(),
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Product Added Successfully!'), backgroundColor: Colors.green),
                            );
                            Navigator.pop(context); // يرجع لشاشة المدير بعد ما يحفظ
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                            );
                          }

                          setState(() { isLoading = false; });
                        },
                        child: const Text('Save Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}