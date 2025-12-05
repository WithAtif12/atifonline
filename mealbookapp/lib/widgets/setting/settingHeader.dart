import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final bool showActionButton;
  final String actionText;
  final VoidCallback? onPressed;

  const SectionHeading({
    super.key,
    required this.title,
    this.showActionButton = true,
    this.actionText = "See All",
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          /// Optional Button
          if (showActionButton)
            GestureDetector(
              onTap: onPressed,
              child: Text(
                actionText,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.orange.shade300 : Colors.orange.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
