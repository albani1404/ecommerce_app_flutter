import 'package:animations/animations.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/screen/chackOut.dart';
import 'package:e_commerce_flutter/widget/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyScreen extends StatefulWidget {
  final Product product;

  const BuyScreen({super.key, required this.product});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  int _quantity = 0;
  final ProductController controller = Get.put(ProductController());

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeType(widget.product).length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () =>
              controller.switchBetweenProductSizes(widget.product, index),
          child: AnimatedContainer(
            margin: const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            width: controller.isNominal(widget.product) ? 40 : 70,
            decoration: BoxDecoration(
              color:
                  controller.sizeType(widget.product)[index].isSelected == false
                      ? Colors.white
                      : const Color(0xFFEC6813),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 0.4,
              ),
            ),
            duration: const Duration(milliseconds: 300),
            child: FittedBox(
              child: Text(
                controller.sizeType(widget.product)[index].numerical,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Produk'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xFFE5E6E8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: CarouselSlider(items: widget.product.images),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.product.name,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rp.${widget.product.price.toString()}',
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: GetBuilder<ProductController>(
              builder: (_) => productSizesListView(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                splashRadius: 10.0,
                onPressed: _decrementQuantity,
                icon: const Icon(
                  Icons.remove,
                  color: Color(0xFFEC6813),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _quantity.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                splashRadius: 10.0,
                onPressed: _incrementQuantity,
                icon: const Icon(Icons.add, color: Color(0xFFEC6813)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Text(
                  "\$${(widget.product.price * _quantity).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFEC6813),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: OpenContainer(
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: const Center(
                    child: Text(
                      'Beli Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              openBuilder: (BuildContext _, VoidCallback __) {
                return CheckoutScreen(
                  cartItem: CartItem(
                    product: widget.product,
                    quantity: _quantity,
                  ),
                );
              },
              transitionDuration: const Duration(seconds: 1),
              transitionType: ContainerTransitionType.fadeThrough,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
