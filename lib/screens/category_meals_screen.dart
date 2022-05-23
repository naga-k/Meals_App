import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals' ;
  const CategoryMealsScreen({Key? key}) : super(key: key);

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {

    Map<String, String> routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String categoryTitle = routeArgs['title']!;
    String categoryId = routeArgs['id']!;
    List categoryMeals = dummyMeals.where(
            (meal) => meal.categories.contains(categoryId)
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability
            );
          },
      itemCount:categoryMeals.length ,
      ),
    );
  }
}
