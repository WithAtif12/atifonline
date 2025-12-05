import 'package:flutter/material.dart';
import 'package:mealbookapp/widgets/recipelist.dart';

class Favouritescreen extends StatefulWidget {
  final List<Map<String, dynamic>> favorites;
  final VoidCallback onFavoritesUpdated;

  const Favouritescreen({
    super.key,
    required this.favorites,
    required this.onFavoritesUpdated,
  });

  @override
  State<Favouritescreen> createState() => _FavouritescreenState();
}

class _FavouritescreenState extends State<Favouritescreen> {
  void toggleFavorite(Map<String, dynamic> recipe, bool isFav) {
    setState(() {
      if (isFav) {
        widget.favorites.removeWhere((item) => item['title'] == recipe['title']);
      } else {
        widget.favorites.add(recipe);
      }
    });

    // Notify Home to refresh
    widget.onFavoritesUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Favourites",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: widget.favorites.isEmpty
          ? const Center(
        child: Text(
          "No favourites added yet!",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      )
          :  RecipeList(
                    recipes: widget.favorites
              .map((f) => Map<String, String>.from(f))
              .toList(),
                    favorites: widget.favorites,
                    onFavoriteToggle: toggleFavorite,
                  ),

    );
  }
}
