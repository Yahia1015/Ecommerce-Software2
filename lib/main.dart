import 'package:flutter/material.dart';

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
        // استخدام ألوان احترافية (كحلي وذهبي)
        primaryColor: const Color(0xFF000080), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000080),
          foregroundColor: Color(0xFFFFD700),
          centerTitle: true,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F8FF),
      ),
      home: const BrowseProductsScreen(),
    );
  }
}

class BrowseProductsScreen extends StatelessWidget {
  const BrowseProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات منتجات وهمية بناءً على الـ Class Diagram بتاعك
    final List<Map<String, dynamic>> products = [
      {"name": "Luxury Watch", "price": 250.0, "stock": 10},
      {"name": "Leather Bag", "price": 120.0, "stock": 5},
      {"name": "Premium Perfume", "price": 85.0, "stock": 20},
      {"name": "Smart Glasses", "price": 150.0, "stock": 8},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Products', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Color(0xFF000080), size: 30),
              title: Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('Price: \$${product['price']}  |  In Stock: ${product['stock']}'),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart, color: Color(0xFFDAA520), size: 28),
                onPressed: () {
                  // ده الحدث بتاع (Add to Cart) اللي في الـ Sequence Diagram
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product['name']} added to cart!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}