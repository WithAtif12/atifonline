import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mealbookapp/screen/Meallistscreen.dart';
import 'package:mealbookapp/screen/groceryscreen.dart';
import 'package:mealbookapp/screen/home.dart';
import 'package:mealbookapp/screen/settingscreen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;
  String categoryName = "Chicken Tikka";

  List<Widget> getScreens() {
    return [
      const Home(),
      const Groceryscreen(),
      MealListScreen(categoryName: categoryName),
      const SettingScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreens()[selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.grey[300],
        indicatorColor: Colors.black.withOpacity(0.2),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          final color = states.contains(MaterialState.selected)
              ? Colors.black
              : Colors.grey[600];

          return TextStyle(
            color: color,
            fontWeight:
            states.contains(MaterialState.selected) ? FontWeight.w600 : null,
          );
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home, color: Colors.black54),
            selectedIcon: Icon(Iconsax.home, color: Colors.black),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.local_grocery_store_outlined, color: Colors.black54),
            selectedIcon: Icon(Icons.local_grocery_store_outlined, color: Colors.black),
            label: "Grocery",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.heart, color: Colors.black54),
            selectedIcon: Icon(Iconsax.heart, color: Colors.black),
            label: "Wishlist",
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.black54),
            selectedIcon: Icon(Icons.person, color: Colors.black),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
