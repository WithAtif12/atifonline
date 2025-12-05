import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mealbookapp/widgets/grocery.dart';
import '../widgets/horizantalcategorychip.dart';
import '../widgets/customsearchfield.dart';

class Groceryscreen extends StatefulWidget {
  const Groceryscreen({super.key});

  @override
  State<Groceryscreen> createState() => _GroceryscreenState();
}

class _GroceryscreenState extends State<Groceryscreen> {
  final TextEditingController searchController = TextEditingController();

  final List<String> grocery = [
    'All',
    'Specialty Stores',
    'Snacks & Bakery',
    'Frozen Food',
    'Household Essentials',
    'Personal Care',
    'Beverages',
  ];

  int selectedGrocery = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          // ---------------- TOP SECTION ----------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LOCATION ROW
                Row(
                  children: const [
                    Icon(Iconsax.location, color: Colors.black, size: 35),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Code With Atif...',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Peshawar',
                          style: TextStyle(
                            color: Colors.black54,
                            height: 1.5,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border, color: Colors.black, size: 35),
                  ],
                ),
                const SizedBox(height: 15),
                // SEARCH BAR
                CustomSearchField(
                  controller: searchController,
                  icon: Icons.search,
                  hintText: "Search for groceries...",
                  height: 50,
                  textColor: Colors.black,
                  secondaryTextColor: Colors.black54,
                  iconColor: Colors.black,
                  fillColor: Colors.grey[200],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // ---------------- DRAGGABLE SHEET ----------------
          DraggableScrollableSheet(
            initialChildSize: 0.75,
            maxChildSize: 1.0,
            minChildSize: 0.75,
            builder: (context, scrollCtrl) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22),
                  ),
                ),
                child: ListView(
                  controller: scrollCtrl,
                  padding: const EdgeInsets.all(15),
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Grocery Hub',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // CATEGORY CHIPS
                    HorizontalCategoryChips(
                      items: grocery,
                      selectedIndex: selectedGrocery,
                      onSelected: (index) {
                        setState(() => selectedGrocery = index);
                      },
                    ),
                    const SizedBox(height: 10),
                    // GROCERY ITEMS
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: [
                        Grocery(
                          image: 'assets/groceryImages/bakery.jpeg',
                          title: 'Bakery Store',
                          price: 'Rs.160',
                          bgColor: Colors.grey[200]!,
                          textColor: Colors.black,
                          time: '30-60 min',
                        ),
                        Grocery(
                          image: 'assets/groceryImages/frozenfood.png',
                          title: 'Frozen Food',
                          price: 'Rs.160',
                          bgColor: Colors.grey[200]!,
                          textColor: Colors.black,
                            time: '30-60 min',
                        ),
                        Grocery(
                          image: 'assets/groceryImages/houseessentials.png',
                          title: 'House Essentials',
                          price: 'Rs.160',
                          bgColor: Colors.grey[200]!,
                          textColor: Colors.black,
                          time: '30-60 min',
                        ),
                        Grocery(
                          image: 'assets/groceryImages/ORGANIC.png',
                          title: 'Organics',
                          price: 'Rs.160',
                          bgColor: Colors.grey[200]!,
                          textColor: Colors.black,
                          time: '30-60 min',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
