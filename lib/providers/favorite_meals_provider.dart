import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoritesStatus(Meal meal) {
    final meals = List.of(state);

    if (meals.contains(meal)) {
      meals.remove(meal);
      state = meals;
      return false;
    } else {
      meals.add(meal);
      state = meals;
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);
