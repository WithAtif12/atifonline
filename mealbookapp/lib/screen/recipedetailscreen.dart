import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Map<String, String> recipe;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    _isFav = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.recipe['title']!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView(
        children: [
          // IMAGE
          Stack(
            children: [
              Image.asset(
                widget.recipe['image']!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() => _isFav = !_isFav);
                    widget.onFavoriteToggle();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // INFO ROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 5),
                Text("4.4", style: TextStyle(color: Colors.black)),
                SizedBox(width: 8),
                Text("(400+ reviews)", style: TextStyle(color: Colors.black54)),
                Spacer(),
                Icon(Icons.access_time, color: Colors.black),
                SizedBox(width: 5),
                Text("40-60 min", style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // DESCRIPTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Description:\nThis is a delicious ${widget.recipe['title']} recipe. Perfect for any occasion.",
              style: const TextStyle(color: Colors.black87),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cooking started!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Cook Now", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
