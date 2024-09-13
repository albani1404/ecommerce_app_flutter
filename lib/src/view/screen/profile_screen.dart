import 'dart:io';
import 'package:e_commerce_flutter/src/view/screen/store/register_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

class profilScreen extends StatefulWidget {
  const profilScreen({super.key});

  @override
  State<profilScreen> createState() => _profilScreenState();
}

class _profilScreenState extends State<profilScreen> {
  File? image;

  Future<void> pilihGambar(BuildContext context) async {
    final picker = ImagePicker();
    final pickeImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickeImage != null) {
      setState(() {
        image = File(pickeImage.path);
      });
    }
    void hapusGambar() {
      setState(() {
        image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  pilihGambar(
                      context); // Memanggil fungsi _pickImage saat gambar ditekan
                },
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: image != null
                        ? Image.file(
                            image!,
                            height: 100,
                            width: 100,
                          )
                        : Image.asset(
                            'assets/images/profile_pic.png',
                            height: 100,
                            width: 100,
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                'AHMAD ALBANI ISLAMI',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              TextButton.icon(
                style: ButtonStyle(
                  maximumSize:
                      MaterialStateProperty.all(const Size.fromWidth(3000)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                icon: const Icon(Icons.shop),
                label: const Text('buat toko anda '),
              )
            ],
          )
        ],
      ),
    );
  }
}
