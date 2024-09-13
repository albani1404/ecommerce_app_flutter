import 'package:e_commerce_flutter/widget/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<ProductController>(
          init: ProductController(), // Inisialisasi ProductController
          builder: (controller) {
            controller
                .getFavoriteItems(); // Panggil getFavoriteItems di dalam builder
            return ProductGridView(
              items: controller.filteredProducts,
              likeButtonPressed: (index) => controller.isFavorite(index),
              isPriceOff: (product) => controller.isPriceOff(product),
            );
          },
        ),
      ),
    );
  }
}
