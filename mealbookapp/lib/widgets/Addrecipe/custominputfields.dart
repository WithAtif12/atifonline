import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final int? maxLines;
  final double? height;

  // Colors
  final Color? fillColor;
  final Color? textColor;
  final Color? hintStyleColor;

  const CustomInputField({
    super.key,
    this.label,
    required this.hint,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.maxLines,
    this.height,
    this.fillColor,
    this.textColor,
    this.hintStyleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        SizedBox(
          height: height ?? 50,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            maxLines: maxLines ?? 1,
            style: TextStyle(
              color: textColor,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: hintStyleColor,
              ),
              filled: true,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              suffixIcon: suffixIcon != null
                  ? Icon(
                suffixIcon,
                color: textColor,
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
