import 'package:e_commerce_flutter/src/view/screen/store/store.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            'sucsess!',
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
          ),
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/ceklist.jpg',
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.green),
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TokoSayaScreen()));
                },
                child: const Text(
                  'Lanjut',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
