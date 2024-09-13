import 'package:e_commerce_flutter/widget/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:get/get.dart';

enum AppbarActionType { text, trailing }

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  ProductListScreen({super.key});

  Widget appBarActionButton(AppbarActionType type) {
    IconData icon = Icons.ac_unit_outlined;

    if (type == AppbarActionType.trailing) {
      icon = Icons.notifications;
    }

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.lightGrey,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }

  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 270, // Lebar TextField disesuaikan dengan kebutuhan
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon:
                          Icon(Icons.search), // Ikutkan ikon pencarian di sini
                    ),
                  ),
                ),
              ),
              appBarActionButton(AppbarActionType.trailing),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppData.recommendedProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                  color: AppData.recommendedProducts[index].cardBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '30% OFF DURING \nCOVID 19',
                            textHeightBehavior: const TextHeightBehavior(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppData
                                  .recommendedProducts[index]
                                  .buttonBackgroundColor,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Get Now",
                              style: TextStyle(
                                color: AppData.recommendedProducts[index]
                                    .buttonTextColor!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(key: Key(AppData.dummyText)),
                    Image.asset(
                      'assets/images/shopping.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "special for you",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getAllItems();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lets gets somethings?",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                _recommendedProductListView(context),
                _topCategoriesHeader(context),
                // _topCategoriesListView(),
                GetBuilder(builder: (ProductController controller) {
                  return ProductGridView(
                    items: controller.filteredProducts,
                    likeButtonPressed: (index) => controller.isFavorite(index),
                    isPriceOff: (product) => controller.isPriceOff(product),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductListScreen(),
  ));
}
