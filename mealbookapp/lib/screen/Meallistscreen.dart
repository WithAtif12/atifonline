import 'package:flutter/material.dart';
import 'package:mealbookapp/widgets/navigationmenu.dart';

class MealListScreen extends StatelessWidget {
  final String categoryName;

  const MealListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // static meals (replace images as needed)
    List<Map<String, String>> meals = [
      {"title": "Chicken Biryani", "image": "assets/images/ChickenTikka.jpeg"},
      {"title": "Beef Karahi", "image": "assets/images/ChickenTikka.jpeg"},
      {"title": "Shinwari Tikka", "image": "assets/images/ChickenTikka.jpeg"},
      {"title": "Chicken Broast", "image": "assets/images/ChickenTikka.jpeg"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavigationMenu()),
                );
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            const SizedBox(width: 20),
            Text(
              "$categoryName Meals",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          var meal = meals[index];
          return Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.asset(
                    meal["image"]!,
                    height: 100,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  meal["title"]!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
