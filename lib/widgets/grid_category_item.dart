import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class GridCategoryItem extends StatelessWidget {
  const GridCategoryItem(this.category, this._onCategorySelcted, {super.key});

  final Category category;
  final void Function() _onCategorySelcted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onCategorySelcted(),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
