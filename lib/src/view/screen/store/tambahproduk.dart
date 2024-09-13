import 'package:e_commerce_flutter/src/view/screen/store/productsucsess.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Tambah Produk', home: productsrore());
  }
}

class AddProduk extends StatefulWidget {
  final List<SimpanData> products; // Terima list produk dari HomeScreen

  const AddProduk({super.key, required this.products});

  @override
  _AddProdukState createState() => _AddProdukState();
}

class _AddProdukState extends State<AddProduk> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _ukuranController = TextEditingController();

  bool? kondisi;
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveProduct() {
    if (_namaController.text.isEmpty ||
        _hargaController.text.isEmpty ||
        _stokController.text.isEmpty ||
        _ukuranController.text.isEmpty ||
        _deskripsiController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lengkapi semua data produk')));
      return;
    }

    // Membuat instance dari SimpanData
    SimpanData newProduct = SimpanData()
      ..setName = _namaController.text
      ..setPrice = _hargaController.text
      ..setStock = _stokController.text
      ..setSize = _ukuranController.text
      ..setDescription = _deskripsiController.text
      ..setIsNew = kondisi ?? true
      ..setImage = _image;

    // Kirim produk baru ke halaman sebelumnya
    Navigator.pop(context, newProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Foto Produk'),
              const SizedBox(height: 8.0),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 150.0,
                  color: Colors.grey[300],
                  child: Center(
                    child: _image == null
                        ? const Icon(Icons.add_a_photo, size: 50)
                        : Image.file(
                            _image!,
                            height: 100,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _namaController,
                validator: (value) =>
                    value!.isEmpty ? 'Nama produk tidak boleh kosong' : null,
                decoration: const InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _stokController,
                decoration: const InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _ukuranController,
                decoration: const InputDecoration(
                  labelText: 'Ukuran',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Kondisi: '),
                  Radio<bool>(
                    value: true,
                    groupValue: kondisi,
                    onChanged: (bool? value) {
                      setState(() {
                        kondisi = value;
                      });
                    },
                  ),
                  const Text('Baru'),
                  Radio<bool>(
                    value: false,
                    groupValue: kondisi,
                    onChanged: (bool? value) {
                      setState(() {
                        kondisi = value;
                      });
                    },
                  ),
                  const Text('Bekas'),
                ],
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Produk',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_namaController.text.isEmpty ||
                          _hargaController.text.isEmpty ||
                          _stokController.text.isEmpty ||
                          _ukuranController.text.isEmpty ||
                          _deskripsiController.text.isEmpty ||
                          _image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Lengkapi semua data produk')),
                        );
                      } else {
                        setState(() {
                          SimpanData simpan = SimpanData();
                          simpan.setName = _namaController.text;
                          simpan.setPrice = _hargaController.text;
                          simpan.setStock = _stokController.text;
                          simpan.setSize = _ukuranController.text;
                          simpan.setDescription = _deskripsiController.text;
                          simpan.setIsNew = kondisi ?? true;
                          simpan.setImage = _image;
                          widget.products.add(
                              simpan); // Menambahkan produk baru ke dalam list products
                          Navigator.pop(
                              context); // Kembali ke halaman sebelumnya setelah menyimpan produk
                        });
                      }
                    },
                    child: const Text(
                      'simpan',
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ])),
      ),
    );
  }
}

// Kelas untuk menyimpan data produk
class SimpanData {
  late String name; // Nama produk
  late String price; // Harga produk
  late String stock; // Stok produk
  late String size; // Ukuran produk
  late String description; // Deskripsi produk
  late bool isNew; // Kondisi produk (Baru atau Bekas)
  late File? image; // Gambar produk

  // Getter dan setter untuk masing-masing field
  String get getName => name;
  String get getPrice => price;
  String get getStock => stock;
  String get getSize => size;
  String get getDescription => description;
  bool get getIsNew => isNew;
  File? get getImage => image;

  set setName(String val) => name = val;
  set setPrice(String val) => price = val;
  set setStock(String val) => stock = val;
  set setSize(String val) => size = val;
  set setDescription(String val) => description = val;
  set setIsNew(bool val) => isNew = val;
  set setImage(File? val) => image = val;
}
