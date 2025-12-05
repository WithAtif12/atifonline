import 'package:flutter/material.dart';
import 'package:mealbookapp/widgets/navigationmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealBook App',

      // Single Light Theme Only
      home: const NavigationMenu(),
    );
  }
}
