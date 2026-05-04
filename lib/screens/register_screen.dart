import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // مكتبة الحسابات بتاعت فايربيز
import 'login_screen.dart';

// حولنا الشاشة لـ StatefulWidget عشان نقدر نتحكم في البيانات اللي بتتكتب
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // دول 3 متحكمات (Controllers) وظيفتهم يمسكوا الكلام اللي العميل بيكتبه في الخانات
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_add, size: 80, color: Color(0xFF000080)),
              const SizedBox(height: 20),
              const Text(
                'Create New Account',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF000080)),
              ),
              const SizedBox(height: 30),
              
              // خانة الاسم
              TextField(
                controller: nameController, // ربطنا الخانة بالمتحكم بتاعها
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),

              // خانة الإيميل
              TextField(
                controller: emailController, // ربطنا الخانة بالمتحكم بتاعها
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              
              // خانة الباسورد
              TextField(
                controller: passwordController, // ربطنا الخانة بالمتحكم بتاعها
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),
              
              // زرار إنشاء الحساب
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDAA520),
                    foregroundColor: const Color(0xFF000080),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () async {
                    try {
                      // سطر السحر: بياخد الإيميل والباسورد ويرميهم في سيرفر جوجل
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      
                      // لو التسجيل نجح، بنطلع رسالة خضرا ونوديه لشاشة الدخول
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Account Created Successfully!'), backgroundColor: Colors.green),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    } on FirebaseAuthException catch (e) {
                      // لو في إيرور (زي إن الإيميل متسجل قبل كده أو الباسورد أقل من 6 حروف) بنطلع رسالة حمرا
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message ?? 'Error occurred'), backgroundColor: Colors.red),
                      );
                    }
                  },
                  child: const Text('Register', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              
              // زرار الرجوع لشاشة الدخول
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Already have an account? Login',
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