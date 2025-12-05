import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final IconData icon;
  final String hintText;
  final Color? textColor;
  final Color? iconColor;
  final Color? secondaryTextColor;
  final Color? fillColor;
  final double? height;

  const CustomSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    required this.icon,
    required this.hintText,
    this.textColor,
    this.iconColor,
    this.secondaryTextColor,
    this.fillColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: fillColor ,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: secondaryTextColor,
            ),
            prefixIcon: Icon(
              icon,
              color: iconColor ,
              size: height != null ? height! * 0.6 : 24,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}
