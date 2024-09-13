import 'package:e_commerce_flutter/src/view/screen/store/regisSucses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();
  final _storeAddressController = TextEditingController();
  final _storeEmailController = TextEditingController();
  final _storePhoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final userEmail = prefs.getString('user_email');
    if (userEmail != null) {
      setState(() {
        _storeEmailController.text = userEmail;
      });
    }
  }

  @override
  void dispose() {
    _storeNameController.dispose();
    _storeAddressController.dispose();
    _storeEmailController.dispose();
    _storePhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register toko'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _storeNameController,
                decoration: const InputDecoration(
                  labelText: 'Store Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a store name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _storeAddressController,
                decoration: const InputDecoration(
                  labelText: 'Store Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a store address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _storeEmailController,
                decoration: const InputDecoration(
                  labelText: 'Store Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a store email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value!)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _storePhoneController,
                decoration: const InputDecoration(
                  labelText: 'Store Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a store phone number';
                  }
                  if (!RegExp(
                          r'^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$')
                      .hasMatch(value!)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16)),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle form submission
                        final storeName = _storeNameController.text;
                        final storeAddress = _storeAddressController.text;
                        final storeEmail = _storeEmailController.text;
                        final storePhone = _storePhoneController.text;
                        // Do something with the form data
                        print('Store Name: $storeName');
                        print('Store Address: $storeAddress');
                        print('Store Email: $storeEmail');
                        print('Store Phone: $storePhone');
                      }
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Success()));
                    },
                    child: const Text(
                      'register',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
