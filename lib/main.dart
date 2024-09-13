import 'package:e_commerce_flutter/core/app_theme.dart';
import 'package:e_commerce_flutter/src/view/screen/register_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart'; // Pastikan impor ini tidak dikomentari

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/RegisterPage': (context) => const RegisterPage(),
        '/home_screen': (context) =>
            const HomeScreen(), // Pastikan ini tidak dikomentari
      },
    );
  }
}
