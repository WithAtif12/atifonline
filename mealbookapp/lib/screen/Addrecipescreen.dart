import 'package:flutter/material.dart';

import 'package:mealbookapp/widgets/Addrecipe/custominputfields.dart';

class Addrecipescreen extends StatelessWidget {
  const Addrecipescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // ---- Add Recipe Header -----//
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add Recipe',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ---- Title & other fields -----//
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputField(
                    label: 'Recipe Title *',
                    hint: 'Name',
                    height: 50,
                    fillColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 18),
                  CustomInputField(
                    label: 'Category',
                    hint: 'Snack',
                    suffixIcon: Icons.keyboard_arrow_down_sharp,
                    height: 50,
                    fillColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 18),
                  CustomInputField(
                    label: 'Cook Time (minutes) *',
                    hint: 'Time',
                    height: 50,
                    fillColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Difficulty',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          hint: 'Easy',
                          height: 50,
                          fillColor: Colors.grey[200],
                          textColor: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomInputField(
                          hint: 'Medium',
                          height: 50,
                          fillColor: Colors.grey[200],
                          textColor: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomInputField(
                          hint: 'Hard',
                          height: 50,
                          fillColor: Colors.grey[200],
                          textColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  CustomInputField(
                    label: 'Image URL (optional)',
                    hint: 'URL',
                    height: 50,
                    fillColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 18),
                  CustomInputField(
                    label: 'Rating',
                    hint: 'rating here',
                    suffixIcon: Icons.star,
                    height: 50,
                    fillColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Ingredients *',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          hint: 'Ingredient name',
                          height: 50,
                          fillColor: Colors.grey[200],
                          textColor: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomInputField(
                          hint: 'Quality',
                          height: 50,
                          fillColor: Colors.grey[200],
                          textColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  CustomInputField(
                    hint: 'Add description',
                    label: 'Description',
                    maxLines: 6,
                    fillColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Save Recipe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
