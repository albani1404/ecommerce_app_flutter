import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController txEmailController = TextEditingController();
  final TextEditingController txPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: txEmailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
