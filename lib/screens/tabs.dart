import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorite_meals_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const FiltersScreen();
          },
        ),
      );
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage;
    String title = '';

    switch (_selectedPageIndex) {
      case 0:
        activePage = CategoriesScreen(availableMeals: availableMeals);
        title = 'Categories';
        break;
      case 1:
        activePage = MealsScreen(meals: favoriteMeals);
        title = 'Your Favourites';
        break;
      default:
        activePage = const Center(
          child: Text('Error'),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: activePage,
      drawer: MainDrawer(_setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => _selectPage(index),
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
