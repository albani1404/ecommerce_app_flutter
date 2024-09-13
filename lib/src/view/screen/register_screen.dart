import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const RegisterPage());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Register',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
          centerTitle: true,
        ),
        body: const RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text('username'),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          const Text('email'),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          const Text('pasword'),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text(
                'I HAVE ACOUNT',
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              // Implementasi logika pendaftaran di sini
              String username = _usernameController.text;
              String email = _emailController.text;
              String password = _passwordController.text;
              // Contoh validasi sederhana
              if (username.isNotEmpty &&
                  email.isNotEmpty &&
                  password.isNotEmpty) {
                // Lakukan sesuatu, misalnya lakukan pendaftaran
                print(
                    'Username: $username, Email: $email, Password: $password');
                // Redirect ke halaman lain, misalnya dashboard
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              } else {
                // Tampilkan pesan kesalahan jika input tidak valid
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please fill in all fields.'),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
