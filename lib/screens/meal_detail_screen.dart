import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text){
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Widget buildSurroundingContainer({required Widget child}){
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:Colors.grey),
      borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }



  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context)?.settings.arguments as String ;
    final selectedMeal = dummyMeals.firstWhere(
            (meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          buildSectionTitle(context, 'Ingredients'),
            buildSurroundingContainer(
              child : ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildSurroundingContainer(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                              child: Text('${(index + 1)}'),
                        ),
                        title: Text(
                              selectedMeal.steps[index],

                        ),
                      ),
                      const Divider(),
                    ],
                      ),
                  itemCount: selectedMeal.steps.length,
                ))
          ],
        ),
      ),
    );
  }
}
