import 'package:appcrew/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          try {
            await auth.signup(emailCtrl.text.trim(), passCtrl.text.trim());
            Get.offAllNamed(Routes.notes);
          } catch (e) {
            Get.snackbar('Error', e.toString());
          }
        },
        child: Container(
          height: 40,
          alignment: .center,
          padding: .all(10),
          margin: .all(20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: .circular(10),
          ),

          child: const Text(
            'Create Account',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
