import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // مكتبة قاعدة البيانات
import 'package:firebase_auth/firebase_auth.dart'; // مكتبة الحسابات لمعرفة مين اللي بيطلب

List<Map<String, dynamic>> myCart = [];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCheckingOut = false; // عشان نعمل علامة تحميل وقت الدفع

  double get totalPrice {
    return myCart.fold(0, (sum, item) => sum + (item['price'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: myCart.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: myCart.length,
                    itemBuilder: (context, index) {
                      final item = myCart[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(item['imageUrl']),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('\$${item['price']}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                myCart.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
                      ),
                      isCheckingOut 
                        ? const CircularProgressIndicator() 
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDAA520),
                              foregroundColor: const Color(0xFF000080),
                            ),
                            onPressed: () async {
                              if (myCart.isNotEmpty) {
                                setState(() { isCheckingOut = true; });

                                try {
                                  // بنجيب بيانات العميل اللي مسجل دخول دلوقتي
                                  final currentUser = FirebaseAuth.instance.currentUser;
                                  
                                  // بنبعت الطلب لجدول جديد اسمه orders في فايربيز
                                  await FirebaseFirestore.instance.collection('orders').add({
                                    'userEmail': currentUser?.email ?? 'Guest',
                                    'items': myCart,
                                    'totalAmount': totalPrice,
                                    'orderDate': FieldValue.serverTimestamp(),
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Order Placed Successfully!'), backgroundColor: Colors.green),
                                  );
                                  
                                  setState(() {
                                    myCart.clear(); // تفريغ السلة بعد نجاح الطلب
                                  });
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                                  );
                                }

                                setState(() { isCheckingOut = false; });
                              }
                            },
                            child: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}