import 'package:flutter/material.dart';
import 'package:meals_app/categories_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
          children:  DUMMY_CATEGORIES.map((categoryData) =>
              CategoryItem(
                title: categoryData.title,
                color: categoryData.color,
              )
          ).toList()),
    );
  }
}
