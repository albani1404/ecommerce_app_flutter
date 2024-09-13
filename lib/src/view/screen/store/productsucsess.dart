import 'package:e_commerce_flutter/src/view/screen/store/tambahproduk.dart';
import 'package:flutter/material.dart';

class productsrore extends StatefulWidget {
  const productsrore({super.key});

  @override
  State<productsrore> createState() => _productsroreState();
}

class _productsroreState extends State<productsrore> {
  List<SimpanData> products = [];

  void _navigateToAddProduk(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProduk(products: products)),
    );

    // ...
  }

  void _handleProductAdded(SimpanData newProduct) {
    setState(() {
      products.add(newProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('product anda'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToAddProduk(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: product.getImage != null
                ? Image.file(product.getImage!,
                    width: 80, height: 80, fit: BoxFit.cover)
                : const Icon(Icons.image),
            title: Text(product.getName),
            subtitle:
                Text('Harga: ${product.getPrice}, Stok: ${product.getStock}'
                    '${product.getImage}'),
          );
        },
      ),
    );
  }
}


// import 'dart:convert';
// import 'dart:io';

// class SimpanData {
//   late String name; // Nama produk
//   late String price; // Harga produk
//   late String stock; // Stok produk
//   late String size; // Ukuran produk
//   late String description; // Deskripsi produk
//   late bool isNew; // Kondisi produk (Baru atau Bekas)
//   late File? image; // Gambar produk

//   // Getter dan setter untuk masing-masing field
//   String get getName => name;
//   String get getPrice => price;
//   String get getStock => stock;
//   String get getSize => size;
//   String get getDescription => description;
//   bool get getIsNew => isNew;
//   File? get getImage => image;

//   set setName(String val) => name = val;
//   set setPrice(String val) => price = val;
//   set setStock(String val) => stock = val;
//   set setSize(String val) => size = val;
//   set setDescription(String val) => description = val;
//   set setIsNew(bool val) => isNew = val;
//   set setImage(File? val) => image = val;

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'price': price,
//       'stock': stock,
//       'size': size,
//       'description': description,
//       'isNew': isNew,
//       'image': image != null ? base64Encode(image!.readAsBytesSync()) : null,
//     };
//   }

//   SimpanData.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     price = json['price'];
//     stock = json['stock'];
//     size = json['size'];
//     description = json['description'];
//     isNew = json['isNew'];
//     if (json['image'] != null) {
//       final bytes = base64Decode(json['image']);
//       image = File.fromRawPath(bytes);
//     } else {
//       image = null;
//     }
//   }
// }