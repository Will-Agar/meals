import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });

  final List<Meal> meals;
  final String? title;

  Widget getMealItem(BuildContext ctx, int index) {
    final meal = meals[index];
    return Text(
      meal.title,
      style: const TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget errorMessage = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category.',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (BuildContext ctx, int index) => MealItem(meals[index]),
    );

    if (title == null) {
      return meals.isEmpty ? errorMessage : content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: meals.isEmpty ? errorMessage : content,
    );
  }
}
