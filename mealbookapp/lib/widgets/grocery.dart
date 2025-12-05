import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Grocery extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String time;
  final String text;
  final Color bgColor;
  final Color textColor;
  final IconData icon;

  const Grocery({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.time,
    this.bgColor = const Color(0xFFE0E0E0),
    this.textColor = Colors.black,
    this.icon = Icons.timer,
    this.text ='Free for first delivery',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Column with Title & Row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
             Text(
                  time,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
                // Row with Icon, Time & Price
                Row(
                  children: [
                    Icon(Icons.bike_scooter_outlined, color: Colors.orange, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      price,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 10),
Expanded(
  child: Text(
    text,style: TextStyle(
   color: Colors.orange,
    fontWeight: FontWeight.w700,
  ),
  ),
)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
