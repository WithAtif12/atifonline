import 'package:flutter/material.dart';
import 'package:mealbookapp/widgets/popularrecipe.dart';
import '../screen/recipedetailscreen.dart';

class RecipeList extends StatelessWidget {
  final List<Map<String, String>> recipes;
  final List<Map<String, dynamic>> favorites;
  final Function(Map<String, String>, bool) onFavoriteToggle;

  const RecipeList({
    super.key,
    required this.recipes,
    required this.favorites,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        bool isFav = favorites.any((item) => item['title'] == recipe['title']);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RecipeDetailScreen(
                  recipe: recipe,
                  isFavorite: isFav,
                  onFavoriteToggle: () => onFavoriteToggle(recipe, isFav),
                ),
              ),
            );
          },
          child: PopularRecipe(
            name: recipe['title']!,
            image: recipe['image']!,
            price: recipe['price'] ?? "Rs.129",
            rating: recipe['rating'] != null ? double.parse(recipe['rating']!) : 4.4,
            reviews: recipe['reviews'] != null ? int.parse(recipe['reviews']!) : 400,
            time: recipe['time'] ?? "40-60 min",
            isFavorite: isFav,
            onFavoriteToggle: () => onFavoriteToggle(recipe, isFav),
          ),
        );
      },
    );
  }
}
