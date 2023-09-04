import 'package:flutter/material.dart';
import 'package:login_signup/screens/bottom_bar/my_cart/my_cart.dart';
import 'package:login_signup/screens/bottom_bar/personal_details/personal_detals.dart';
import 'package:login_signup/screens/bottom_bar/products/products.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class BottomNAvBarScreen extends StatefulWidget {
  BottomNAvBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNAvBarScreen> createState() => _BottomNAvBarScreenState();
}

class _BottomNAvBarScreenState extends State<BottomNAvBarScreen> {
  List<Widget> pages = [
    ProductsScreen(),
    MyCartScreen(),
    PersonalDetailsScreen()


  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Products"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("My Cart"),
            selectedColor: Colors.pink,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Personal"),
            selectedColor: Colors.pink,
          ),

          /// Search\

        ],
      ),

      body: SafeArea(child: pages[_currentIndex]),
    );

  }
}
