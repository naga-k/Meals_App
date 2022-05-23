import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {

    Map<String, String> routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String categoryTitle = routeArgs['title']!;
    String categoryId = routeArgs['Id']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: Text('The Recipes Here'),
      ),
    );
  }
}
