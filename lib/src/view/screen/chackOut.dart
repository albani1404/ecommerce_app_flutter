import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:flutter/widgets.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CheckoutScreen extends StatelessWidget {
  final CartItem cartItem;

  const CheckoutScreen({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;
    final quantity = cartItem.quantity;
    final totalPrice = product.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tambahkan gambar produk di sini
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                  product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Jumlah Barang: $quantity'),
            const SizedBox(height: 16),
            Text(
              'Total Harga: Rp. ${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Metode Pembayaran',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Tambahkan widget untuk memilih metode pembayaran di sini
            const SizedBox(height: 16),
            const Text(
              'Alamat Pengiriman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Tambahkan widget untuk mengisi alamat pengiriman di sini
            const Spacer(),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Chackout',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
