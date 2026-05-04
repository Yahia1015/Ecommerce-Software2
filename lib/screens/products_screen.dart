import 'package:flutter/material.dart';
import 'cart_screen.dart'; // سطر الربط بشاشة السلة

class BrowseProductsScreen extends StatefulWidget {
  const BrowseProductsScreen({super.key});

  @override
  State<BrowseProductsScreen> createState() => _BrowseProductsScreenState();
}

class _BrowseProductsScreenState extends State<BrowseProductsScreen> {
  final List<Map<String, dynamic>> products = [
    {"name": "Luxury Watch", "price": 250.0, "stock": 10},
    {"name": "Leather Bag", "price": 120.0, "stock": 5},
    {"name": "Premium Perfume", "price": 85.0, "stock": 20},
    {"name": "Smart Glasses", "price": 150.0, "stock": 8},
  ];

  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Products', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
              );
            },
          )
        ],
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
                  setState(() {
                    cartItems.add(product);
                  });
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