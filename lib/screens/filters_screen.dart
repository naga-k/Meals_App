import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';
  final Map<String, bool> currentFilters;
  final void Function(Map<String, bool> fliters) saveFilters;
  const FiltersScreen({Key? key, required this.saveFilters, required this.currentFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFree;
  late bool _vegetarian ;
  late bool _vegan;
  late bool _lactoseFree;

  @override
  void initState(){
    super.initState();
  _glutenFree = widget.currentFilters['gluten'] as bool;
  _vegetarian = widget.currentFilters['vegetarian'] as bool;
  _vegan = widget.currentFilters['vegan'] as bool;
  _lactoseFree = widget.currentFilters['lactose'] as bool;
}

  Widget _buildSwitchListTile({
    required String title,
    required String description,
    required bool currentValue,
    required void Function(bool) updateValue,
  }){
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> filters = {
                  'gluten' : _glutenFree,
                  'lactose' : _lactoseFree,
                  'vegan' : _vegan,
                  'vegetarian' : _vegetarian,
                };

                widget.saveFilters(filters);},
              icon:const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      title: 'Gluten-free',
                      description: 'Only include gluten-free meals',
                      currentValue: _glutenFree,
                      updateValue: (newValue){
                        setState((){
                          _glutenFree = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Lactose-free',
                      description: 'Only include lactose-free meals',
                      currentValue: _lactoseFree,
                      updateValue: (newValue){
                        setState((){
                          _lactoseFree = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Vegan',
                      description: 'Only include Vegan meals',
                      currentValue: _vegan,
                      updateValue: (newValue){
                        setState((){
                          _vegan = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Vegetarian',
                      description: 'Only include vegetarian meals',
                      currentValue: _vegetarian,
                      updateValue: (newValue){
                        setState((){
                          _vegetarian = newValue;
                        });
                      })
                ],
              )
          )
        ],
      )
    );
  }
}
