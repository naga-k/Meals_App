import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData){
    setState((){
      _filters = filterData;
      _availableMeals = dummyMeals.where(
              (meal){
                if(_filters['gluten']! && !meal.isGlutenFree){
                  return false;
                }
                if(_filters['lactose']! && !meal.isLactoseFree){
                  return false;
                }
                if(_filters['vegan']! && !meal.isVegan){
                    return false;
                }
                if(_filters['vegetarian']! && !meal.isVegetarian){
                  return false;
                }
                return true;

              }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Raleway'
    );
    return MaterialApp(
      title:  'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)
            ),
            subtitle2: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              color: Colors.black,
              fontWeight: FontWeight.bold
            )
        )
      ),
      routes: {
        '/' : (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(availableMeals: _availableMeals,),
        MealDetailScreen.routeName : (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(
          saveFilters: _setFilters,
          currentFilters: _filters,
        ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text('My App'),
      ),
    );

  }
}

