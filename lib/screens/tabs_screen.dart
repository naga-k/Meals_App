import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;
  const TabsScreen({Key? key, required this.favouriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;

  late List<Map<String,Object>> _pages;


  void _selectPage(int index){
   setState((){
     _selectedPageIndex = index ;
   });
  }

  @override
  void initState(){
    super.initState();
    _pages =  [
      {
        'page' : const CategoriesScreen(),
        'title' : 'Categories'
      },
      {
        'page' : FavoritesScreen(favouritedMeals: widget.favouriteMeals,),
        'title' : 'Favorites'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage ,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          //
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.category),
              label: 'Categories'
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.star),
                label: 'Favourites'
            )
          ],
        ),
      )
    );
  }
}
