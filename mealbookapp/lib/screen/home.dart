import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mealbookapp/screen/favouritescreen.dart';
import 'package:mealbookapp/widgets/recipelist.dart';
import '../widgets/customsearchfield.dart';
import '../widgets/horizantalcategorychip.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> filteredRecipes = [];
  List<Map<String, dynamic>> favorites = [];

  final List<Map<String, String>> allRecipes = [
    {
      "title": "Chicken Tikka",
      "category": "Dinner",
      "image": "assets/images/ChickenTikka.jpeg"
    },
    {
      "title": "Omelette",
      "category": "Breakfast",
      "image": "assets/images/omglate.jpeg"
    },
    {
      "title": "Grilled Salmon",
      "category": "Lunch",
      "image": "assets/images/Gridded salmon1.jpeg"
    },
  ];

  final List<String> mealTypes = [
    'All', 'Breakfast', 'Lunch', 'Dinner', 'American', 'Indian', 'Dessert',
  ];
  int activeMealType = 0;

  @override
  void initState() {
    super.initState();
    filteredRecipes = allRecipes;
  }

  void filterSearch(String query) {
    final search = query.toLowerCase();
    setState(() {
      filteredRecipes = allRecipes.where((recipe) {
        final title = recipe["title"]?.toLowerCase() ?? '';
        final category = recipe["category"]?.toLowerCase() ?? '';
        return title.contains(search) || category.contains(search);
      }).toList();
    });
  }

  Future<void> _refreshRecipes() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() => filteredRecipes = allRecipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.orange,
            child: Column(
              children: [
                const SizedBox(height: 50),
                // TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.location, color: Colors.black, size: 30),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Code With Atif...',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Peshawar',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Favouritescreen(
                                favorites: favorites,
                                onFavoritesUpdated: () => setState(() {}), // refresh Home
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.favorite_border, color: Colors.black, size: 30),
                      ),

                      const SizedBox(width: 10),
                      const Icon(Iconsax.setting, color: Colors.black, size: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // SEARCH BAR
                CustomSearchField(
                  controller: searchController,
                  onChanged: filterSearch,
                  icon: Icons.search,
                  hintText: "Search for recipes...",
                  textColor: Colors.black,
                  secondaryTextColor: Colors.black54,
                  iconColor: Colors.black,
                  fillColor: Colors.grey[200]!,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          // DRAGGABLE SHEET
          Positioned.fill(
            top: 190,
            child: DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.4,
              maxChildSize: 1,
              builder: (_, scrollController) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: RefreshIndicator(
                    onRefresh: _refreshRecipes,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      children: [
                        HorizontalCategoryChips(
                          items: mealTypes,
                          selectedIndex: activeMealType,
                          onSelected: (index) => setState(() => activeMealType = index),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Popular Recipes",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        filteredRecipes.isEmpty
                            ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: Column(
                              children: const [
                                Icon(Icons.search, size: 60, color: Colors.black54),
                                Text(
                                  "No recipe found!",
                                  style: TextStyle(color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  "Try adjusting your search or category filter",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        )
                            : RecipeList(
                          recipes: filteredRecipes,
                          favorites: favorites,
                          onFavoriteToggle: (recipe, isFav) {
                            setState(() {
                              if (isFav) {
                                favorites.removeWhere((item) => item['title'] == recipe['title']);
                              } else {
                                favorites.add(recipe);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
