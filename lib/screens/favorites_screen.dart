import 'package:flutter/material.dart';
import 'package:meals_order_app/models/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favList;

  FavoritesScreen(this.favList);

  @override
  Widget build(BuildContext context) {
    if (favList.isEmpty) {
      return Center(
        child: Text('Hello From Favorites!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: favList[i].id,
            title: favList[i].title,
            afford: favList[i].affordability,
            complx: favList[i].complexity,
            imgUrl: favList[i].imageUrl,
            duration: favList[i].duration,
          );
        },
        itemCount: favList.length,
      );
    }
  }
}
