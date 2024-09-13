import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/favorite_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<Widget> screens = [
    ProductListScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const profilScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: HomeScreen.screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: AppData.bottomNavyBarItems
            .map(
              (item) => BottomNavyBarItem(
                icon: item.icon,
                title: item.title,
                activeColor: item.activeColor,
                inactiveColor: item.inactiveColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
