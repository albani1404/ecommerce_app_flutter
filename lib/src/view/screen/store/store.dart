import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/screen/store/productsucsess.dart';
import 'package:e_commerce_flutter/src/view/screen/store/tambahproduk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TokoSayaApp());
}

class TokoSayaApp extends StatelessWidget {
  const TokoSayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Saya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TokoSayaScreen(),
    );
  }
}

class TokoSayaScreen extends StatelessWidget {
  const TokoSayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Saya'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset('assets/images/github.png'),
                          ),
                          const Text('Albani'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Card(
                      child: _buildMenuItem(
                        Icons.shopping_bag,
                        'Produk',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const productsrore(),
                            ),
                          );
                        },
                      ),
                    ),
                    Card(
                      child: _buildMenuItem(
                        Icons.add_circle,
                        'Tambah Produk',
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddProduk(products: List.empty())));
                        },
                      ),
                    ),
                    Card(
                      child: _buildMenuItem(
                        Icons.local_shipping,
                        'Siap Dikirim',
                        () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeScreen(),
                          //   ),
                          // );
                        },
                      ),
                    ),
                    Card(
                      child: _buildMenuItem(
                        Icons.assignment,
                        'Pesanan Baru',
                        () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const HomeScreen(),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 225, 224, 224),
                        ),
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                              label: const Text('Ulasan'),
                            ),
                            const Divider(),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.chat),
                              label: const Text('Diskusi'),
                            ),
                            const Divider(),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.location_on),
                              label: const Text('Alamat Toko'),
                            ),
                            const Divider(),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.settings),
                              label: const Text('Settings'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 32.0),
      label: Text(label),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
