import 'package:flutter/material.dart';
import '../models/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const namedRoute = '\filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten-free'];
    _lactoseFree = widget.currentFilters['lactose-free'];
    _vegan = widget.currentFilters['vegan'];
    _vegeterian = widget.currentFilters['vegeterian'];

    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function onTap,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      value: value,
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.purple,
        ),
      ),
      onChanged: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters!'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten-free': _glutenFree,
                'lactose-free': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Adjust Your Meal Selections!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile('Gluten-Free',
                    'Only Meals That Are Gluten-Free', _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchTile('Lactose-Free',
                    'Only Meals That Are Lactose-Free', _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchTile('Vegan', 'Only Meals That Are Vegans', _vegan,
                    (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                _buildSwitchTile(
                    'Vegeterian', 'Only Meals That Are Vegeterian', _vegeterian,
                    (newVal) {
                  setState(() {
                    _vegeterian = newVal;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
