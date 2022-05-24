import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals' ;
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String _categoryTitle;
  late List<Meal> _displayMeals;
  bool _loadedInitialData = false;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(!_loadedInitialData) {
      Map<String, String> routeArgs = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      _categoryTitle = routeArgs['title']!;
      String categoryId = routeArgs['id']!;
      _displayMeals = dummyMeals.where(
              (meal) => meal.categories.contains(categoryId)
      ).toList();
      _loadedInitialData = true;
    }
  }
  void _removeMeal(String mealId){
    setState((){
      _displayMeals.removeWhere(
              (meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: _displayMeals[index].id,
                title: _displayMeals[index].title,
                imageUrl: _displayMeals[index].imageUrl,
                duration: _displayMeals[index].duration,
                complexity: _displayMeals[index].complexity,
                affordability: _displayMeals[index].affordability,
                removeItem: _removeMeal,
            );
          },
      itemCount:_displayMeals.length ,
      ),
    );
  }
}
