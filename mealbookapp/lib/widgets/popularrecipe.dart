import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PopularRecipe extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final double rating;
  final int reviews;
  final String time;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const PopularRecipe({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.time,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 300,
        width: double.infinity,
        // margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with favorite icon
            Stack(
              children: [
                ClipRRect(
                   borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[800],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
SizedBox(height: 8,),
            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Iconsax.location,size: 18,color: Colors.orange,),
                      SizedBox(width: 3,),
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            "$rating",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "($reviews reviews)",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Icon(Icons.bike_scooter_rounded,color: Colors.orange,size: 18,),
                      SizedBox(width: 4,),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // Price
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
