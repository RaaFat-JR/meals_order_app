import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import '../models/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const namedRoute = '/category-meals';

  final List<Meal> mealsAvailable;

  CategoryMeals(this.mealsAvailable);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> mealCategory;

  @override
  void didChangeDependencies() {
    final catArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = catArgs['title'];
    final categoryId = catArgs['id'];
    mealCategory = widget.mealsAvailable.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      mealCategory.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: mealCategory[i].id,
            title: mealCategory[i].title,
            afford: mealCategory[i].affordability,
            complx: mealCategory[i].complexity,
            imgUrl: mealCategory[i].imageUrl,
            duration: mealCategory[i].duration,
          );
        },
        itemCount: mealCategory.length,
      ),
    );
  }
}
