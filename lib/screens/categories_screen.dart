import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3/2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
          ),
          children:  dummyCategories.map((categoryData) =>
              CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                color: categoryData.color,
              )
          ).toList()),
    );



    //   Scaffold(
    //   appBar: AppBar(
    //     title: const Text('DeliMeal'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(15),
    //     child:
    //   ),
    // );
  }
}
