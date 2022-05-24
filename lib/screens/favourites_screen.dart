import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouritedMeals;
  const FavoritesScreen({Key? key, required this.favouritedMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favouritedMeals.isEmpty){
      return Center(
        child: Text('You have no favourites - start adding some!'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouritedMeals[index].id,
            title: favouritedMeals[index].title,
            imageUrl: favouritedMeals[index].imageUrl,
            duration: favouritedMeals[index].duration,
            complexity: favouritedMeals[index].complexity,
            affordability: favouritedMeals[index].affordability,
          );
        },
        itemCount: favouritedMeals.length ,
      );
    }
  }
}
